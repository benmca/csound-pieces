/* This module is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License (GPL) as published by
 * the Free Software Foundation version 2.
 *
 * As an exception to clause 2b of the GPL under which this code is
 * released, this source code and all of its associated files may be used
 * (compiled and/or statically or dynamically) linked and/or executed)
 * with the program known as Csound (any version released under the MIT
 * license associated with Barry Vercoe's original version).
 *
 * Csound was originally written by Barry Vercoe and released to the public
 * under a license from MIT.
 *
 * This exception is not intended as a general waiver of the requirement
 * in clause 2b. In particular, this exception does not permit the use of
 * this source code with versions of Csound released under licenses other
 * than the MIT license associated with the "public" version of the
 * program."Extended Csound" from Analog Devices would be one example of
 * a "different version" of Csound.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

/***************************************************************************
 * vi:set nowrap ts=4:
 *
 * Ball-within-a-box physical model reverberator
 * originally written by Paolo Filippi (paolfili@ml.swapnet.it) of CSC
 * (Centro di Sonologia Computazionale - Universita' di Padova, Italia)
 *
 * Model of a rectangular enclosure implemented by means of a
 * Circulant Feedback Delay Network
 *
 * The name BaBo and the whole structure of the model is
 * described in the article :
 * [1] D. Rocchesso  "The Ball within the Box: a sound-processing
 *                metaphor", Computer Music Journal, Vol 19, N. 4,
 *                pp. 45-47, Winter 1995.
 *
 * Circulant Feedback Delay Networks (CFDN) are described in the article:
 * [2] D. Rocchesso and J.O. Smith "Circulant and Elliptic Feedback Delay Networks
 *                for Artificial Reverberation", IEEE Trans. on Speech and
 *                Audio Processing, vol. 5, n. 1, pp. 51-63, jan. 1997.
 *
 * Maximally-Diffusive CFDNs are described in the letter:
 * [3] D. Rocchesso "Maximally-Diffusive yet Efficient Feedback Delay Networks
 *                for Artificial Reverberation", IEEE Signal Processing Letters,
 *                vol. 4, n. 9, pp. 252-255, sep. 1997.
 *
 * This implementation has been developed under the advice of
 * Davide Rocchesso (rocchesso@sci.univr.it) and
 * Nicola Bernardini (nicb@axnet.it)
 *
 * $Id: babo.c,v 3.5 2000/09/22 09:08:26 nicb Exp $
 *
 * This module is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 ***************************************************************************/

/*
 * You will find the functions you are looking for (probably baboset()
 * and babo()) at the end of this file. Before that, there is some
 * explanation of the structure of babo and then a bunch of private
 * functions used by baboset() and babo().
 */

/*
 *In general, (x,y,z) are coordinates in a three-dimensional space, either
 *of the sound source or of the pickup point (we use a pair of omnidi-
 *rectional pickups aligned with the x axis).
 *When the diffusion is maximal, each row of the matrix contains a
 *maximum-length sequence of +1 and -1. When the diffusion is minimal, the
 *matrix is diagonal. The continuous control of diffusion is done by moving
 *the eigenvalues along the unit circle and taking the inverse discrete fourier
 *transform of them [2,3].
 */

/*------------------------------------------------------------------------*\

BABO STRUCTURE
^^^^ ^^^^^^^^^

        ____
------>|    |tap0 (direct)
input  |    |------>|
       | T  |tap1   |
       | A  |------>|
       | P  |tap2   |
       | L  |------>|                _____________________________
       | I  |       |               |                             |
       | N  |......>|  +------------| g(0)  g(1)  g(2) ... g(14)  |-------+
       | E  |tap6   |  |  +---------| g(14) g(0)  g(1) ... g(13)  |-----+ |
       |    |------>|  |  |  +------| g(13) g(14) g(0) ... g(12)  |----+| |
       |____|   |   |  |  |  |      | ..........................  |    || |
                |   |  |  |  |      | ..........................  |....|| |
                |   |  |  |  |      | ..........................  |   .|| |
                |   |  |  |  |  +---| g(1)  g(2)  g(3) ... g(0)   |-+ .|| |
                |   |  |  |  |  |   |_____________________________| | .|| |
                |   |  |  |  |  |                                   | .|| |
                |   |  |  |  |  |                                   | .|| |
                |   |  |  |  |  |                                   | .|| |
                ----|-(+)-|--|--|-----(z0)--------------------------+-.||-+
                |   |     |  |  |                                   | .|| |
                ----|----(+)-|--|--------------(z1)-----------------|-.|+ |
                |   |        |  |                                   | .|| |
                ----|-------(+)-|--------------------(z2)-----------|-.+| |
                |   |           |                                   | .|| |
                ....|...........|...................................|.+|| |
                |   |           |                                   | .|| |
                ----|----------(+)-------------------------(z14)----+ .|| |
                    | tapline_out                                   (  +  )
                    |                                                  |
                    |                                                  |
                    |                                                  |
                    |             | early_diffuse                      |
                    |             v              (1 - early_diffuse)->(*)
                    |------------(*)----------------------------------(+)
                                                                       |
                                                                       |+-->

\*-------------------------------------------------------------------------*/

/* Changes by JPff: #define'd out include of "config.h"
                    Defined FLT_MAX
                    Move static fn declaratins out of function
 */

#include "cs.h"
#include "babo.h"
#ifdef CUD
#include "config.h"
#endif
#include <math.h>
#include <string.h>

/*
 * Add compilers that understand 'inline' here...
 */
#if defined(__GNUC__)
#       define  INLINE  inline
#else
#       define  INLINE          /* compilers that do not understand 'inline' */
                                /* That is ANSI C Compilers */
#define BaboMemory_samples(this) ((this)->samples)
#define BaboMemory_start(this) ((MYFLT *) (this)->memptr.auxp)
#define BaboMemory_end(this) ((MYFLT *) (this)->memptr.endp)
#define BaboMemory_size(this) ((MYFLT *) (this)->memptr.size)
#define BaboNode_input(this,input) (BaboDelay_input(&(this)->delay, input))
#define BaboNode_feed_filter(this) \
        (BaboLowPass_input(&(this)->filter, BaboDelay_output(&(this)->delay)))
#define BaboNode_output(this) (BaboLowPass_output(&(this)->filter))
#define BaboMatrix_coefficient(this,x,y) ((this)->fdn[x][y])
#endif /* defined(__GNUC__) */

#if !defined(FLT_MAX)
#define FLT_MAX         (1.0e38)
#endif

static const int sound_speed = 330;

/*
 * private Babo tools
 */

#define square(x)   ((x)*(x))

INLINE long
bround(MYFLT x)
{
    return (long)(x >= 0 ? x + FL(0.5) : x - FL(0.5));
}

/*
 * Memory allocation object methods
 *
 * (this object is a bit funny because it is in fact a wrapper of the
 * memory allocation functions in csound)
 */

static BaboMemory *
BaboMemory_create(BaboMemory *this, size_t size_in_floats)
{
    size_t size_in_bytes = size_in_floats * sizeof(MYFLT);

    auxalloc((long) size_in_bytes, &this->memptr);

    memset(this->memptr.auxp, 0, size_in_bytes);

    this->samples = size_in_floats;

    return this;
}

#if defined(__GNUC__)
INLINE static size_t
BaboMemory_samples(const BaboMemory *this)
{
    return this->samples;
}

INLINE static MYFLT *
BaboMemory_start(const BaboMemory *this)
{
    return (MYFLT *) this->memptr.auxp;
}

INLINE static MYFLT *
BaboMemory_end(const BaboMemory *this)
{
    return (MYFLT *) this->memptr.endp;
}

INLINE static MYFLT *
BaboMemory_size(const BaboMemory *this)
{
    return (MYFLT *) this->memptr.size;
}
#endif

/*
 * common delay/tapline methods
 */

static void
_Babo_common_delay_create(BaboDelay *this, MYFLT max_time)
{
    size_t num_floats = (size_t) bround((MYFLT)ceil((double)(max_time * esr)));

    BaboMemory_create(&this->core, num_floats);
}

/*
 * Babo Delay object methods
 */

static BaboDelay *
BaboDelay_create(BaboDelay *this, MYFLT max_time)
{
    _Babo_common_delay_create(this, max_time);

    this->input = BaboMemory_start(&this->core);

    return this;
}

static MYFLT
BaboDelay_input(BaboDelay *this, MYFLT input)
{
     *this->input++ = input;

    if (this->input >= BaboMemory_end(&this->core))
        this->input -= BaboMemory_samples(&this->core);

    return input;
}

static MYFLT
BaboDelay_output(const BaboDelay *this)
{
    size_t num_samples = BaboMemory_samples(&this->core);
    MYFLT *output_ptr = this->input - (num_samples - 1);

    if (output_ptr < BaboMemory_start(&this->core))
        output_ptr += num_samples;

    return *output_ptr;
}

/*
 * Babo Tapline object methods
 */

/*
 * The tapline is created with a size that is dependent on the size
 * of the room (selected at i-time)
 */

static BaboTapline *
BaboTapline_create(BaboTapline *this, MYFLT x, MYFLT y, MYFLT z)
{
    MYFLT max_time = (MYFLT)(2.0 * sqrt((x*x) + (y*y) + (z*z))) / sound_speed;

    _Babo_common_delay_create((BaboDelay *) this, max_time);

    this->input = BaboMemory_start(&this->core);

    return this;
}

INLINE static MYFLT
BaboTapline_maxtime(BaboDelay *this)
{
    return (((MYFLT) BaboMemory_samples(&this->core)) / esr);
}

INLINE static MYFLT
BaboTapline_input(BaboTapline *this, MYFLT input)
{
    return BaboDelay_input((BaboDelay *) this, input);
}

typedef struct
{
    MYFLT   attenuation;
    MYFLT   delay_size;
} BaboTapParameter;

typedef struct
{
    BaboTapParameter    direct;
    BaboTapParameter    tap[BABO_TAPS];
} BaboTaplineParameters;

/*
 * BaboTapline_single_output:
 * this function calculates the delay output by doing linear interpolation
 * between the two adjacent integer sample delays of an otherwise fractional
 * delay time. This is why BaboTapParameter.delay_size is kept as a float
 * in the first place.
 */
/* a-rate function */
static MYFLT
BaboTapline_single_output(const BaboTapline *this, const BaboTapParameter *p)
{
        /*
         * the assignement right below should be really a floor(p->delay_size),
         * but apparently floor() calls are really expensive on some
         * architectures (notably Pentiums), so we do a simple cast to a
         * size_t instead. This should always work, but I cannot test it on
         * other architectures than mine (k6), so it potentially is a source
         * of problems. [nicb@axnet.it]
         */
    size_t delay_floor  = (size_t) p->delay_size;
    size_t delay_ceil   = delay_floor + 1;
    MYFLT fractional    = p->delay_size - (MYFLT) delay_floor;
    MYFLT *output_floor = this->input - delay_floor;
    MYFLT *output_ceil  = this->input - delay_ceil;
    MYFLT output = FL(0.0);

    if (output_floor <  BaboMemory_start(&this->core))
        output_floor += BaboMemory_samples(&this->core);

    if (output_ceil <  BaboMemory_start(&this->core))
        output_ceil += BaboMemory_samples(&this->core);

    output = (*output_floor*(1-fractional)) + (*output_ceil*fractional);

    return output * p->attenuation;
}

/* k-rate function */
INLINE static void
BaboTapline_preload_parameter(BaboTapParameter *this, MYFLT distance)
{
    /*
     * Direct sound parameters at the input of delay tap_lines.
     * Right and left direct_att is not really physical, but ensures that:
     *          direct_att=(1/2) when distance is 1 m
     *          direct_att=1     when distance is 0 m.
     */
    this->delay_size    = (distance / sound_speed) * esr;
    this->attenuation   = 1 / (1 + distance);
}

/* k-rate function */
static BaboTaplineParameters *
BaboTapline_precalculate_parameters(const BaboTapline *this,
    BaboTaplineParameters   *results,
    MYFLT r_x, MYFLT r_y, MYFLT r_z,    /* receiver position (i-rate) */
    MYFLT s_x, MYFLT s_y, MYFLT s_z,    /* source   position (k-rate) */
    MYFLT l_x, MYFLT l_y, MYFLT l_z)    /* room     coords   (i-rate) */
{
    MYFLT   sqr_xy, sqr_yz, sqr_xz, /* x^2+y^2  y^2+z^2 .......         */
            sqr_diff_x, sqr_diff_y, sqr_diff_z; /* optimization temps   */

    /* image method distance calculation */

    sqr_diff_x  = square(r_x - s_x);
    sqr_diff_y  = square(r_y - s_y);
    sqr_diff_z  = square(r_z - s_z);

    sqr_yz      = sqr_diff_y + sqr_diff_z;
    sqr_xz      = sqr_diff_x + sqr_diff_z;
    sqr_xy      = sqr_diff_x + sqr_diff_y;

    BaboTapline_preload_parameter(&results->direct, (MYFLT)sqrt(sqr_diff_x + sqr_yz));

    BaboTapline_preload_parameter(&results->tap[0],
                                        (MYFLT)sqrt(square(l_x + r_x + s_x) + sqr_yz));
    BaboTapline_preload_parameter(&results->tap[1],
                                        (MYFLT)sqrt(square(l_x - r_x - s_x) + sqr_yz));

    BaboTapline_preload_parameter(&results->tap[2],
                        (MYFLT)sqrt(sqr_xz + square(l_y - r_y - s_y)));
    BaboTapline_preload_parameter(&results->tap[3],
                        (MYFLT)sqrt(sqr_xz + square(l_y + r_y + s_y)));

    BaboTapline_preload_parameter(&results->tap[4],
                                        (MYFLT)sqrt(sqr_xy + square(l_z - r_z - s_z)));
    BaboTapline_preload_parameter(&results->tap[5],
                                        (MYFLT)sqrt(sqr_xy + square(l_z + r_z + s_z)));

    return results;
}

/* a-rate function */
static MYFLT
BaboTapline_output(const BaboTapline *this,
    const BaboTaplineParameters *pars)
{
    int     i;
    MYFLT   output = BaboTapline_single_output(this, &pars->direct);

    for(i = 0; i < BABO_TAPS; ++i)
      output  += BaboTapline_single_output(this, &pars->tap[i]);

    return output;
}

/*
 * Babo lowpass filter object methods
 */

static BaboLowPass *
BaboLowPass_create(BaboLowPass *this, MYFLT decay, MYFLT hidecay, MYFLT norm)
{
    MYFLT real_decay    = (MYFLT)exp(norm * log(decay));
    MYFLT real_hidecay  = (MYFLT)exp(norm * log(hidecay));

    this->a0 = (real_decay + real_hidecay) / 4;
    this->a1 = (real_decay - real_hidecay) / 2;
    this->z1 = this->z2 = FL(0.0);

    return this;
}

INLINE static MYFLT
BaboLowPass_input(BaboLowPass *this, MYFLT input)
{
    this->z2 = this->z1;
    this->z1 = this->input;
    this->input = input;
    return input;
}
INLINE static MYFLT
BaboLowPass_output(const BaboLowPass *this)
{
    return  (this->a0 * this->input)    +
            (this->a1 * this->z1)       +
            (this->a0 * this->z2);
}
/*
 * Babo node object methods
 */

static BaboNode *
BaboNode_create(BaboNode *this, MYFLT time, MYFLT min_time, MYFLT decay,
    MYFLT hidecay)
{
    BaboDelay_create(&this->delay, time);
    BaboLowPass_create(&this->filter, decay, hidecay, time/min_time);

    return this;
}

#if defined(__GNUC__)
INLINE static MYFLT
BaboNode_input(BaboNode *this, MYFLT input)
{
    return BaboDelay_input(&this->delay, input);
}

INLINE static void
BaboNode_feed_filter(BaboNode *this)
{
    BaboLowPass_input(&this->filter, BaboDelay_output(&this->delay));
}

INLINE static MYFLT
BaboNode_output(const BaboNode *this)
{
    return BaboLowPass_output(&this->filter);
}
#endif

/*
 * Babo Matrix object methods
 */

static void
BaboMatrix_create_FDN(BaboMatrix *this, MYFLT diffusion)
{
    int  i,j;
    MYFLT _2PI_NODES = TWOPI_F / BABO_NODES;
    /*
     * The following sequence of eigenvalues provides, by IDFT,
     * the maximally diffusive sequence, i.e. a row of the circulant
     * feedback matrix.
     * eigenvalues are expressed in radians, because only the argument
     * is expressed, since the magnitude is one
     */

    const MYFLT  max_diffusion_eigenvalues[BABO_NODES]=
    {
        FL(3.142592),
       -FL(1.7370),
       -FL(2.1559),
       -FL(1.2566),
       -FL(2.9936),
        FL(1.0472),
       -FL(2.5133),
       -FL(1.6140),
        FL(1.6140),
        FL(2.5133),
       -FL(1.0472),
        FL(2.9936),
        FL(1.2566),
        FL(2.1559),
        FL(1.7370)
    };

    /*
     * Here we multiply the arguments of the sequence of eigenvalues by
     * p->idiffusion_coeff. In this way we scale the amount of diffusion
     * Range of diffusion:   0 = no diffusion
     *                       1 = maximum diffusion
     */

    MYFLT  real_X[BABO_NODES]       = { FL(0.0) },
           imaginary_X[BABO_NODES]  = { FL(0.0) },
           arg_X[BABO_NODES]        = { FL(0.0) },
           real_x[BABO_NODES]       = { FL(0.0) };

    for(i = 0; i < BABO_NODES; ++i)
    {
        real_X[i] = imaginary_X[i] = FL(0.0);
        arg_X[i]  = max_diffusion_eigenvalues[i] * diffusion;
        real_X[i] = (MYFLT)cos(arg_X[i]);
        imaginary_X[i] = (MYFLT)sin(arg_X[i]);
    }

    /*
     * The Real part of the InverseDFT of the eigenvalues supplies the
     * circulant matrix coefficients.                                                   *
     */

    for(i = 0; i < BABO_NODES; ++i)
        for(j = 0; j < BABO_NODES; ++j)
            real_x[j] += (real_X[j] * (MYFLT)cos(_2PI_NODES*i*j)-
                imaginary_X[j] * (MYFLT)sin(_2PI_NODES*i*j))/BABO_NODES;


    for(i = 0; i < BABO_NODES; ++i)
        for(j = 0; j < BABO_NODES; ++j)
            this->fdn[i][j] = real_x[(j-i+15) % BABO_NODES];
}

static MYFLT
BaboMatrix_calculate_delays(MYFLT delay_time[], MYFLT x, MYFLT y, MYFLT z)
{
    int i = 0;
    MYFLT min = FL(0.0);

    const static struct babo_diffusion_constants
    {
        int x, y, z;

    } BABO_DIRECTIONS[] =
    {
        /*
         * Each triplet is a mode identifier.
         * E.g. {1,0,0} is the first axial mode
         */
        { 1, 0, 0 },
        { 2, 1, 0 },
        { 1, 1, 0 },
        { 1, 2, 0 },
        { 0, 1, 0 },
        { 0, 2, 1 },
        { 0, 1, 1 },
        { 0, 1, 2 },
        { 0, 0, 1 },
        { 1, 0, 2 },
        { 1, 0, 1 },
        { 1, 1, 1 },
        { 1, 2, 1 },
        { 2, 1, 1 },
        { 2, 0, 1 }
    };
    /*
     * we calculate the delays related to each node, in the following
     * way:
     *
     *                                   2
     * delay[i] = -----------------------------------------------
     *                      +-----------------------------------
     *    sound_speed * \  / |       |2  |       |2  |       |2
     *                   \/  |  x[i] |   |  y[i] |   |  z[i] |
     *                       | ----- | + | ----- | + | ----- |
     *                       |   X   |   |   Y   |   |   Z   |
     *
     * and we keep a notion of the minimum delay path which is
     * needed later on to do the rescaling of the decay and hidecay
     * parameters.
     */
    min = (MYFLT)FLT_MAX; /* let's initialize this with something really big */

    for(i = 0; i < BABO_NODES; ++i)
    {
        const struct babo_diffusion_constants *dbdp = &BABO_DIRECTIONS[i];
        delay_time[i] = FL(2.0) / (sound_speed *
                        (MYFLT)sqrt(((dbdp->x/x) * (dbdp->x/x)) +
                             ((dbdp->y/y) * (dbdp->y/y)) +
                             ((dbdp->z/z) * (dbdp->z/z))));

        min = min > delay_time[i] ? delay_time[i] : min;
    }
    return min;
}

static BaboMatrix *
BaboMatrix_create(BaboMatrix *this, MYFLT diffusion, MYFLT x, MYFLT y,
    MYFLT z, MYFLT decay, MYFLT hidecay, MYFLT early_diffusion)
{
    int i = 0;
    MYFLT delays[BABO_NODES];
    MYFLT min_delay = BaboMatrix_calculate_delays(delays, x, y, z);

    this->complementary_early_diffusion = 1 - early_diffusion;

    BaboMatrix_create_FDN(this, diffusion);

    for (i = 0; i < BABO_NODES; ++i)
        BaboNode_create(&this->node[i], delays[i], min_delay, decay, hidecay);

    return this;
}

#if defined(__GNUC__)
INLINE static MYFLT
BaboMatrix_coefficient(const BaboMatrix *this, int x, int y)
{
    return this->fdn[x][y];
}
#endif

/* a-rate function */
static void
BaboMatrix_output(BaboMatrix *this, MYFLT outputs[], MYFLT input,
    MYFLT diffusion_coeff)
{
    MYFLT            filter_tmpout[BABO_NODES]  = { FL(0.0) },
                     tmp2[BABO_NODES]           = { FL(0.0) };
    register int     i = 0, j = 0;

    for(i = 0; i < BABO_NODES; ++i)
    {
        filter_tmpout[i] = BaboNode_output(&this->node[i]);
        BaboNode_feed_filter(&this->node[i]);
    }

    /*
     * Here the matrix-by-vector multiply takes place, xout is the
     * column vector.
     * The mod(BABO_NODES) operation allows to write the circulant matrix-
     * by-vector multiply in a compact way.
     */

    for(i = 0; i < BABO_NODES; ++i)
    {
        for(j = 0; j < BABO_NODES; ++j)
            tmp2[i] += BaboMatrix_coefficient(this, i, j) * filter_tmpout[j];

        BaboNode_input(&this->node[i], tmp2[i] + input);
        /* We add delayed signal at the input of ^^^^^  the delay lines. */
    }

    outputs[0] = outputs[1] =   BaboNode_output(&this->node[0]) +
                                BaboNode_output(&this->node[4]) +
                                BaboNode_output(&this->node[8]);

    outputs[0] +=   (diffusion_coeff *
                    ((BaboNode_output(&this->node[7]) +
                      BaboNode_output(&this->node[12]))));

    outputs[1] +=   (diffusion_coeff *
                    ((BaboNode_output(&this->node[9]) +
                      BaboNode_output(&this->node[13]))));

    outputs[0] *=   this->complementary_early_diffusion;
    outputs[1] *=   this->complementary_early_diffusion;
}

/*
 * private utility functions
 */

static void resolve_defaults(BABO *p);
static void set_expert_values(BABO *p);

static void
set_defaults(BABO *p)
{
    resolve_defaults(p);

    p->diffusion_coeff = p->diffusion_coeff < 0 ?
                         BABO_DEFAULT_DIFFUSION_COEFF : p->diffusion_coeff;

    set_expert_values(p);

    /*
     * the user supplies, optionally, the complete distance
     * or else it is set by default
     * we divide by two because it is more handy to deal
     * with half the distance in the program (i.e. the distance
     * from a center point)
     */
    p->inter_receiver_distance /= 2;

}

static void
resolve_defaults(BABO *p)
{
    /*
     * in typical csound backward logic :), the defaults may or may not,
     * depending on how they're used in the orchestra definition,
     * turn out to run on the same pointer - so, basically all optional
     * argument values have to be copied (from last to first) in separate
     * "real" values inside the entry structure in order to be used
     */

    p->expert_values    = *(p->oexpert_values);
    p->diffusion_coeff  = *(p->odiffusion_coeff);
}

INLINE static MYFLT
load_value_or_default(const FUNC *table, int idx, MYFLT dEfault)
{
    MYFLT result = (table != (FUNC *) NULL && idx < table->flen) ?
                   table->ftable[idx] : dEfault;

    return result;
}

static void
set_expert_values(BABO *p)
{
    FUNC    *ftp    = (FUNC *) NULL; /* brain-damaged function calling */
    int      n      = 0;

    if (p->expert_values > 0)
        ftp = ftfind(&(p->expert_values));

    p->decay        = load_value_or_default(ftp, n++, BABO_DEFAULT_DECAY);
    p->hidecay      = load_value_or_default(ftp, n++, BABO_DEFAULT_HIDECAY);
    p->receiver_x   = load_value_or_default(ftp, n++, BABO_DEFAULT_RECV_X);
    p->receiver_y   = load_value_or_default(ftp, n++, BABO_DEFAULT_RECV_Y);
    p->receiver_z   = load_value_or_default(ftp, n++, BABO_DEFAULT_RECV_Z);
    p->inter_receiver_distance = load_value_or_default(ftp, n++,
                                            BABO_DEFAULT_INTER_RECV_DISTANCE);
    p->direct       = load_value_or_default(ftp, n++, BABO_DEFAULT_DIRECT);
    p->early_diffuse= load_value_or_default(ftp, n++, BABO_DEFAULT_DIFFUSE);
}

static void
verify_coherence(BABO *p)
{
    if (*(p->lx) <= FL(0.0) || *(p->ly) <= FL(0.0) || *(p->lz) <= FL(0.0))
    {
        char buf[128] = { '\0' };
        sprintf(buf, "Babo: resonator dimensions are incorrect (%.1f, %.1f, %.1f)",
                *(p->lx), *(p->ly), *(p->lz));
        die(buf);
    }
}

/*
 * PUBLIC FUNCTIONS - baboset(), babo()
 *
 * these get called from the csound engine
 *
 */

void
baboset(void *entry)
{
    BABO *p = (BABO *) entry;   /* assuming the engine is right... :)   */

    set_defaults(p);
    verify_coherence(p);        /* exits if call is wrong */

    BaboTapline_create(&p->tapline, *(p->lx), *(p->ly), *(p->lz));
    BaboDelay_create(&p->matrix_delay, BaboTapline_maxtime(&p->tapline));
    BaboMatrix_create(&p->matrix, p->diffusion_coeff, *(p->lx),
        *(p->ly), *(p->lz), p->decay, p->hidecay, p->early_diffuse);
}

void
babo(void *entry)
{
    register BABO   *p          = (BABO *) entry;
    register int     nsmps      = ksmps;
    register MYFLT  *outleft    = p->outleft,
                    *outright   = p->outright,
                    *input      = p->input;

    BaboTaplineParameters left = { FL(0.0) }, right = { FL(0.0) };

    BaboTapline_precalculate_parameters(&p->tapline, &left,
        p->receiver_x - p->inter_receiver_distance,
        p->receiver_y, p->receiver_z,
        *(p->ksource_x), *(p->ksource_y), *(p->ksource_z),
        *(p->lx), *(p->ly), *(p->lz));

    BaboTapline_precalculate_parameters(&p->tapline, &right,
        p->receiver_x + p->inter_receiver_distance,
        p->receiver_y, p->receiver_z,
        *(p->ksource_x), *(p->ksource_y), *(p->ksource_z),
        *(p->lx), *(p->ly), *(p->lz));

    do                          /* k-time do-while cycle                */
    {
        register MYFLT  left_tapline_out        = FL(0.0),
                        right_tapline_out       = FL(0.0),
                        delayed_matrix_input    = FL(0.0);
                 MYFLT  matrix_outputs[2]       = { FL(0.0) };

        BaboTapline_input(&p->tapline, *input);
        BaboDelay_input(&p->matrix_delay, *input);

        left_tapline_out  = BaboTapline_output(&p->tapline, &left) *
            p->early_diffuse;

        right_tapline_out  = BaboTapline_output(&p->tapline, &right) *
            p->early_diffuse;

        delayed_matrix_input = BaboDelay_output(&p->matrix_delay);

        BaboMatrix_output(&p->matrix, matrix_outputs, delayed_matrix_input,
               p->diffusion_coeff);

        *outleft  = left_tapline_out  + matrix_outputs[0];
        *outright = right_tapline_out + matrix_outputs[1];

        ++input;
        ++outleft;
        ++outright;
    }
    while (--nsmps);
}
