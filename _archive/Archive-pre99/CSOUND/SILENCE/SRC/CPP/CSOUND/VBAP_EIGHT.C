/* vbap_eight.c

functions specific to four loudspeaker VBAP

Ville Pulkki
*/


#include "cs.h"
#include "vbap.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

void vbap_EIGHT_moving_control(VBAP_EIGHT_MOVING  *);

void vbap_EIGHT(VBAP_EIGHT  *p) /* during note performance:   */
{
    MYFLT *outptr, *inptr;
    MYFLT ogain, ngain, gainsubstr;
    MYFLT invfloatn;
    int i,j;

    vbap_EIGHT_control(p);
    for (i=0;i< (EIGHT); i++) {
      p->beg_gains[i]=p->end_gains[i];
      p->end_gains[i]=p->updated_gains[i];
    }

    /* write audio to result audio streams weighted
       with gain factors*/
    invfloatn =  FL(1.0) / (MYFLT) ksmps;
    for (j=0; j<EIGHT ;j++) {
      inptr = p->audio;
      outptr=p->out_array[j+1];
      ogain=p->beg_gains[j];
      ngain=p->end_gains[j];
      gainsubstr = ngain - ogain;
      if (ngain != FL(0.0) || ogain != FL(0.0))
        if (ngain != ogain) {
          for (i = 0; i < ksmps; i++) {
            *outptr++ = *inptr++ *
              (ogain + (MYFLT) i * invfloatn * gainsubstr);
          }
          p->curr_gains[j]= ogain +
            (MYFLT) (i - 1) * invfloatn * gainsubstr;
        }
        else
          for (i=0; i<ksmps; ++i)
            *outptr++ = *inptr++ * ogain;
      else
        for (i=0; i<ksmps; ++i)
          *outptr++ = FL(0.0);
    }
}


void vbap_EIGHT_control(VBAP_EIGHT  *p)
{
    CART_VEC spreaddir[16];
    CART_VEC spreadbase[16];
    ANG_VEC atmp;
    long i,j, spreaddirnum;
    MYFLT tmp_gains[EIGHT],sum=FL(0.0);
    if (p->dim == 2 && fabs(*p->ele) > 0.0) {
      fprintf(stderr,"Warning: truncating elevation to 2-D plane\n");
      *p->ele = FL(0.0);
    }

    if (*p->spread <FL(0.0))
      *p->spread=FL(0.0);
    if (*p->spread >FL(100.0))
      *p->spread=FL(100.0);
    /* Current panning angles */
    p->ang_dir.azi = (MYFLT) *p->azi;
    p->ang_dir.ele = (MYFLT) *p->ele;
    p->ang_dir.length = FL(1.0);
    angle_to_cart(p->ang_dir, &(p->cart_dir));
    calc_vbap_gns(p->ls_set_am, p->dim,  p->ls_sets,
                  p->updated_gains, EIGHT, p->cart_dir);

    /* Calculated gain factors of a spreaded virtual source*/
    if (*p->spread > FL(0.0)) {
      if (p->dim == 3) {
        spreaddirnum=16;
        /* four orthogonal dirs*/
        new_spread_dir(&spreaddir[0], p->cart_dir,
                       p->spread_base, *p->azi, *p->spread);
        new_spread_base(spreaddir[0], p->cart_dir,*p->spread, &p->spread_base);
        cross_prod(p->spread_base, p->cart_dir, &spreadbase[1]);
        cross_prod(spreadbase[1], p->cart_dir, &spreadbase[2]);
        cross_prod(spreadbase[2], p->cart_dir, &spreadbase[3]);
        /* four between them*/
        vec_mean(p->spread_base, spreadbase[1], &spreadbase[4]);
        vec_mean(spreadbase[1], spreadbase[2], &spreadbase[5]);
        vec_mean(spreadbase[2], spreadbase[3], &spreadbase[6]);
        vec_mean(spreadbase[3], p->spread_base, &spreadbase[7]);

        /* four at half spreadangle*/
        vec_mean(p->cart_dir, p->spread_base, &spreadbase[8]);
        vec_mean(p->cart_dir, spreadbase[1], &spreadbase[9]);
        vec_mean(p->cart_dir, spreadbase[2], &spreadbase[10]);
        vec_mean(p->cart_dir, spreadbase[3], &spreadbase[11]);

        /* four at quarter spreadangle*/
        vec_mean(p->cart_dir, spreadbase[8], &spreadbase[12]);
        vec_mean(p->cart_dir, spreadbase[9], &spreadbase[13]);
        vec_mean(p->cart_dir, spreadbase[10], &spreadbase[14]);
        vec_mean(p->cart_dir, spreadbase[11], &spreadbase[15]);

        for (i=1;i<spreaddirnum;i++) {
          new_spread_dir(&spreaddir[i], p->cart_dir,
                         spreadbase[i],*p->azi,*p->spread);
          calc_vbap_gns(p->ls_set_am, p->dim,  p->ls_sets,
                        tmp_gains, EIGHT, spreaddir[i]);
          for (j=0;j<EIGHT;j++) {
            p->updated_gains[j] += tmp_gains[j];
          }
        }
      }
      else if (p->dim == 2) {
        spreaddirnum=6;
        atmp.ele=FL(0.0);
        atmp.azi=*p->azi - *p->spread;
        angle_to_cart(atmp, &spreaddir[0]);
        atmp.azi=*p->azi - *p->spread/2;
        angle_to_cart(atmp, &spreaddir[1]);
        atmp.azi=*p->azi - *p->spread/4;
        angle_to_cart(atmp, &spreaddir[2]);
        atmp.azi=*p->azi + *p->spread/4;
        angle_to_cart(atmp, &spreaddir[3]);
        atmp.azi=*p->azi + *p->spread/2;
        angle_to_cart(atmp, &spreaddir[4]);
        atmp.azi=*p->azi + *p->spread;
        angle_to_cart(atmp, &spreaddir[5]);

        for (i=0;i<spreaddirnum;i++) {
          calc_vbap_gns(p->ls_set_am, p->dim,  p->ls_sets,
                        tmp_gains, EIGHT, spreaddir[i]);
          for (j=0;j<EIGHT;j++) {
            p->updated_gains[j] += tmp_gains[j];
          }
        }
      }
    }
    if (*p->spread > FL(70.0))
      for (i=0;i<EIGHT ;i++) {
        p->updated_gains[i] +=(*p->spread - FL(70.0))/FL(30.0) *
          (*p->spread - FL(70.0))/FL(30.0)*FL(20.0);
      }

    /*normalization*/
    for (i=0;i<EIGHT;i++) {
      sum=sum+(p->updated_gains[i]*p->updated_gains[i]);
    }

    sum=(MYFLT)sqrt((double)sum);
    for (i=0;i<EIGHT;i++) {
      p->updated_gains[i] /= sum;
    }
}

void vbap_EIGHT_init(VBAP_EIGHT  *p)
{                               /* Initializations before run time*/
    int i,j;
    MYFLT *ptr;
    LS_SET *ls_set_ptr;
    p->out_array[0] = NULL;   /* null output */
    p->out_array[1] = p->result1;  /* outputs */
    p->out_array[2] = p->result2;
    p->out_array[3] = p->result3;
    p->out_array[4] = p->result4;
    p->out_array[5] = p->result5;
    p->out_array[6] = p->result6;
    p->out_array[7] = p->result7;
    p->out_array[8] = p->result8;
    p->dim = (int) ls_table[0];   /*reading in loudspeaker info */
    p->ls_am = (int) ls_table[1];
    p->ls_set_am = (int) ls_table[2];
    ptr = &(ls_table[3]);
    p->ls_sets = (LS_SET*) malloc ( p->ls_set_am * sizeof (LS_SET));
    ls_set_ptr = p->ls_sets;
    for (i=0 ; i < p->ls_set_am ; i++) {
      ls_set_ptr[i].ls_nos[2] = 0;     /* initial setting */
      for (j=0 ; j < p->dim ; j++) {
        ls_set_ptr[i].ls_nos[j] = (int) *(ptr++);
      }
      for (j=0 ; j < 9; j++)
        ls_set_ptr[i].ls_mx[j] = FL(0.0);  /*initial setting*/
      for (j=0 ; j < (p->dim) * (p->dim); j++) {
        ls_set_ptr[i].ls_mx[j] = (MYFLT) *(ptr++);
      }
    }

    /* other initialization */
    if (p->dim == 2 && fabs(*p->ele) > 0.0) {
      fprintf(stderr,"Warning: truncating elevation to 2-D plane\n");
      *p->ele = FL(0.0);
    }
    p->ang_dir.azi = (MYFLT) *p->azi;
    p->ang_dir.ele = (MYFLT) *p->ele;
    p->ang_dir.length = FL(1.0);
    angle_to_cart(p->ang_dir, &(p->cart_dir));
    p->spread_base.x= p->cart_dir.y;
    p->spread_base.y= p->cart_dir.z;
    p->spread_base.z= -p->cart_dir.x;
    vbap_EIGHT_control(p);
    for (i=0;i<EIGHT;i++) {
      p->beg_gains[i]=p->updated_gains[i];
      p->end_gains[i]=p->updated_gains[i];
    }
}


void vbap_EIGHT_moving(VBAP_EIGHT_MOVING  *p) /* during note performance:   */
{
    MYFLT *outptr, *inptr;
    MYFLT ogain, ngain, gainsubstr;
    MYFLT invfloatn;
    int i,j;

    vbap_EIGHT_moving_control(p);
    for (i=0;i< (EIGHT); i++) {
      p->beg_gains[i]=p->end_gains[i];
      p->end_gains[i]=p->updated_gains[i];
    }

    /* write audio to resulting audio streams wEIGHTed
       with gain factors*/
    invfloatn =  FL(1.0) / (MYFLT) ksmps;
    for (j=0; j<EIGHT ;j++) {
      inptr = p->audio;
      outptr=p->out_array[j+1];
      ogain=p->beg_gains[j];
      ngain=p->end_gains[j];
      gainsubstr = ngain - ogain;
      if (ngain != FL(0.0) || ogain != FL(0.0))
        if (ngain != ogain) {
          for (i = 0; i < ksmps; i++) {
            *outptr++ = *inptr++ *
              (ogain + (MYFLT) i * invfloatn * gainsubstr);
          }
          p->curr_gains[j]= ogain +
            (MYFLT) (i - 1) * invfloatn * gainsubstr;
        }
        else
          for (i=0; i<ksmps; ++i)
            *outptr++ = *inptr++ * ogain;
      else
        for (i=0; i<ksmps; ++i)
          *outptr++ = FL(0.0);
    }
}

void vbap_EIGHT_moving_control(VBAP_EIGHT_MOVING  *p)
{
    CART_VEC spreaddir[16];
    CART_VEC spreadbase[16];
    ANG_VEC atmp;
    long i,j, spreaddirnum;
    CART_VEC tmp1, tmp2, tmp3;
    MYFLT coeff, angle;
    MYFLT tmp_gains[EIGHT],sum=FL(0.0);
    if (p->dim == 2 && fabs(p->ang_dir.ele) > 0.0) {
      fprintf(stderr,"Warning: truncating elevation to 2-D plane\n");
      p->ang_dir.ele = FL(0.0);
    }

    if (*p->spread <FL(0.0))
      *p->spread=FL(0.0);
    if (*p->spread >FL(100.0))
      *p->spread=FL(100.0);
    if (p->point_change_counter++ >= p->point_change_interval) {
      p->point_change_counter = 0;
      p->curr_fld = p->next_fld;
      if (++p->next_fld >= (int) fabs(*p->field_am)) {
        if (*p->field_am >= FL(0.0)) /* point-to-point */
          p->next_fld = 0;
        else
          p->next_fld = 1;
      }
      if (p->dim == 3) { /*jumping over second field */
        p->curr_fld = p->next_fld;
        if (++p->next_fld >= ((int) fabs(*p->field_am))) {
          if (*p->field_am >= FL(0.0)) /* point-to-point */
            p->next_fld = 0;
          else
            p->next_fld = 1;
        }
      }
      if ((p->fld[abs(p->next_fld)]==NULL))
        die("Missing fields in vbap8move\n");
      if (*p->field_am >= FL(0.0) && p->dim == 2) /* point-to-point */
        if (fabs(fabs(*p->fld[p->next_fld] - *p->fld[p->curr_fld]) - 180.0) < 1.0)
          fprintf(stderr,"Warning: Ambiguous transition 180 degrees.\n");
    }
    if (*p->field_am >= FL(0.0)) { /* point-to-point */
      if (p->dim == 3) { /* 3-D*/
        p->prev_ang_dir.azi =  *p->fld[p->curr_fld-1];
        p->next_ang_dir.azi =  *p->fld[p->next_fld];
        p->prev_ang_dir.ele = *p->fld[p->curr_fld];
        p->next_ang_dir.ele = *p->fld[p->next_fld+1];
        coeff = ((MYFLT) p->point_change_counter) /
          ((MYFLT) p->point_change_interval);
        angle_to_cart( p->prev_ang_dir,&tmp1);
        angle_to_cart( p->next_ang_dir,&tmp2);
        tmp3.x = (FL(1.0)-coeff) * tmp1.x + coeff * tmp2.x;
        tmp3.y = (FL(1.0)-coeff) * tmp1.y + coeff * tmp2.y;
        tmp3.z = (FL(1.0)-coeff) * tmp1.z + coeff * tmp2.z;
        coeff = (MYFLT)sqrt((double)(tmp3.x * tmp3.x +
                                     tmp3.y * tmp3.y +
                                     tmp3.z * tmp3.z));
        tmp3.x /= coeff; tmp3.y /= coeff; tmp3.z /= coeff;
        cart_to_angle(tmp3,&(p->ang_dir));
      }
      else if (p->dim == 2) { /* 2-D */
        p->prev_ang_dir.azi =  *p->fld[p->curr_fld];
        p->next_ang_dir.azi =  *p->fld[p->next_fld ];
        p->prev_ang_dir.ele = p->next_ang_dir.ele =  FL(0.0);
        scale_angles(&(p->prev_ang_dir));
        scale_angles(&(p->next_ang_dir));
        angle = (p->prev_ang_dir.azi - p->next_ang_dir.azi);
        while(angle > FL(180.0))
          angle -= FL(360.0);
        while(angle < -FL(180.0))
          angle += FL(360.0);
        coeff = ((MYFLT) p->point_change_counter) /
          ((MYFLT) p->point_change_interval);
        angle  *=  (coeff);
        p->ang_dir.azi = p->prev_ang_dir.azi -  angle;
        p->ang_dir.ele = FL(0.0);
      }
      else {
        die("Wrong dimension\n");
      }
    }
    else { /* angular velocities */
      if (p->dim == 2) {
        p->ang_dir.azi =  p->ang_dir.azi + (*p->fld[p->next_fld] / ekr);
        scale_angles(&(p->ang_dir));
      }
      else { /* 3D angular*/
        p->ang_dir.azi =  p->ang_dir.azi + (*p->fld[p->next_fld] / ekr);
        p->ang_dir.ele =  p->ang_dir.ele +
          p->ele_vel * (*p->fld[p->next_fld+1] / ekr);
        if (p->ang_dir.ele > FL(90.0)) {
          p->ang_dir.ele = FL(90.0);
          p->ele_vel = -p->ele_vel;
        }
        if (p->ang_dir.ele < FL(0.0)) {
          p->ang_dir.ele = FL(0.0);
          p->ele_vel =  -p->ele_vel;
        }
        scale_angles(&(p->ang_dir));
      }
    }
    angle_to_cart(p->ang_dir, &(p->cart_dir));
    calc_vbap_gns(p->ls_set_am, p->dim,  p->ls_sets,
                  p->updated_gains, EIGHT, p->cart_dir);
    if (*p->spread > FL(0.0)) {
      if (p->dim == 3) {
        spreaddirnum=16;
        /* four orthogonal dirs*/
        new_spread_dir(&spreaddir[0], p->cart_dir,
                       p->spread_base, p->ang_dir.azi, *p->spread);

        new_spread_base(spreaddir[0], p->cart_dir,*p->spread, &p->spread_base);
        cross_prod(p->spread_base, p->cart_dir, &spreadbase[1]);
        cross_prod(spreadbase[1], p->cart_dir, &spreadbase[2]);
        cross_prod(spreadbase[2], p->cart_dir, &spreadbase[3]);
        /* four between them*/
        vec_mean(p->spread_base, spreadbase[1], &spreadbase[4]);
        vec_mean(spreadbase[1], spreadbase[2], &spreadbase[5]);
        vec_mean(spreadbase[2], spreadbase[3], &spreadbase[6]);
        vec_mean(spreadbase[3], p->spread_base, &spreadbase[7]);

        /* four at half spreadangle*/
        vec_mean(p->cart_dir, p->spread_base, &spreadbase[8]);
        vec_mean(p->cart_dir, spreadbase[1], &spreadbase[9]);
        vec_mean(p->cart_dir, spreadbase[2], &spreadbase[10]);
        vec_mean(p->cart_dir, spreadbase[3], &spreadbase[11]);

        /* four at quarter spreadangle*/
        vec_mean(p->cart_dir, spreadbase[8], &spreadbase[12]);
        vec_mean(p->cart_dir, spreadbase[9], &spreadbase[13]);
        vec_mean(p->cart_dir, spreadbase[10], &spreadbase[14]);
        vec_mean(p->cart_dir, spreadbase[11], &spreadbase[15]);

        for (i=1;i<spreaddirnum;i++) {
          new_spread_dir(&spreaddir[i], p->cart_dir,
                         spreadbase[i],p->ang_dir.azi,*p->spread);
          calc_vbap_gns(p->ls_set_am, p->dim,  p->ls_sets,
                        tmp_gains, EIGHT, spreaddir[i]);
          for (j=0;j<EIGHT;j++) {
            p->updated_gains[j] += tmp_gains[j];
          }
        }
      }
      else if (p->dim == 2) {
        spreaddirnum=6;
        atmp.ele=FL(0.0);
        atmp.azi=p->ang_dir.azi - *p->spread;
        angle_to_cart(atmp, &spreaddir[0]);
        atmp.azi=p->ang_dir.azi - *p->spread/2;
        angle_to_cart(atmp, &spreaddir[1]);
        atmp.azi=p->ang_dir.azi - *p->spread/4;
        angle_to_cart(atmp, &spreaddir[2]);
        atmp.azi=p->ang_dir.azi + *p->spread/4;
        angle_to_cart(atmp, &spreaddir[3]);
        atmp.azi=p->ang_dir.azi + *p->spread/2;
        angle_to_cart(atmp, &spreaddir[4]);
        atmp.azi=p->ang_dir.azi + *p->spread;
        angle_to_cart(atmp, &spreaddir[5]);

        for (i=0;i<spreaddirnum;i++) {
          calc_vbap_gns(p->ls_set_am, p->dim,  p->ls_sets,
                        tmp_gains, EIGHT, spreaddir[i]);
          for (j=0;j<EIGHT;j++) {
            p->updated_gains[j] += tmp_gains[j];
          }
        }
      }
    }
    if (*p->spread > FL(70.0))
      for (i=0;i<EIGHT ;i++) {
        p->updated_gains[i] +=(*p->spread - FL(70.0))/FL(30.0) *
          (*p->spread - FL(70.0))/FL(30.0)*FL(10.0);
      }
    /*normalization*/
    for (i=0;i<EIGHT;i++) {
    sum=sum+(p->updated_gains[i]*p->updated_gains[i]);
  }

  sum= (MYFLT)sqrt((double)sum);
  for (i=0;i<EIGHT;i++) {
    p->updated_gains[i] /= sum;
  }
}


void vbap_EIGHT_moving_init(VBAP_EIGHT_MOVING  *p)
{
    int i,j;
    MYFLT *ptr;
    LS_SET *ls_set_ptr;
    p->out_array[0] = NULL;   /* null output */
    p->out_array[1] = p->result1;  /* outputs */
    p->out_array[2] = p->result2;
    p->out_array[3] = p->result3;
    p->out_array[4] = p->result4;
    p->out_array[5] = p->result5;
    p->out_array[6] = p->result6;
    p->out_array[7] = p->result7;
    p->out_array[8] = p->result8;
    /*reading in loudspeaker info */
    p->dim = (int) ls_table[0];
    p->ls_am = (int) ls_table[1];
    p->ls_set_am = (int) ls_table[2];
    ptr = &(ls_table[3]);
    p->ls_sets = (LS_SET*) malloc ( p->ls_set_am * sizeof (LS_SET));
    ls_set_ptr = p->ls_sets;
    for (i=0 ; i < p->ls_set_am ; i++) {
      ls_set_ptr[i].ls_nos[2] = 0;     /* initial setting */
      for (j=0 ; j < p->dim ; j++) {
        ls_set_ptr[i].ls_nos[j] = (int) *(ptr++);
      }
      for (j=0 ; j < 9; j++)
        ls_set_ptr[i].ls_mx[j] = FL(0.0);  /*initial setting*/
      for (j=0 ; j < (p->dim) * (p->dim); j++) {
        ls_set_ptr[i].ls_mx[j] = (MYFLT) *(ptr++);
      }
    }

    /* other initialization */
    p->ele_vel = FL(1.0);    /* functions specific to movement */
    if (fabs(*p->field_am) < (2+ (p->dim - 2)*2)) {
      printf("Have to have at least %d directions in vbapl8move\n",2+ (p->dim - 2)*2);
      exit(-1);
    }
    if (p->dim == 2)
      p->point_change_interval = (int) (ekr * *p->dur / (fabs(*p->field_am) - 1));
    else if (p->dim == 3)
      p->point_change_interval = (int) (ekr * *p->dur / ((fabs(*p->field_am) / 2.0) - 1.0 ));
    else
      die("Wrong dimension\n");
    p->point_change_counter = 0;
    p->curr_fld = 0;
    p->next_fld = 1;
    p->ang_dir.azi = *p->fld[0];
    if(p->dim == 3) {
      p->ang_dir.ele = *p->fld[1];
    } else {
      p->ang_dir.ele = FL(0.0);
    }
    if(p->dim == 3) {
      p->curr_fld = 1;
      p->next_fld = 2;
    }
    angle_to_cart(p->ang_dir, &(p->cart_dir));
    p->spread_base.x= p->cart_dir.y;
    p->spread_base.y= p->cart_dir.z;
    p->spread_base.z= -p->cart_dir.x;
    vbap_EIGHT_moving_control(p);
    for(i=0;i<EIGHT;i++) {
      p->beg_gains[i]=p->updated_gains[i];
      p->end_gains[i]=p->updated_gains[i];
    }
}




