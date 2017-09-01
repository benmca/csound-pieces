/* Spectral Extraction and Amplitude Gating functions */
/* By Richard Karpen  June, 1998  */
/* Based on ideas from Tom Erbe's SoundHack  */

/* Predeclare Functions */

void SpectralExtract(MYFLT  *, MYFLT *, long, long, int, MYFLT);
MYFLT PvocMaxAmp( MYFLT *, long, long);
void PvAmpGate(MYFLT *, long, FUNC *, MYFLT);
