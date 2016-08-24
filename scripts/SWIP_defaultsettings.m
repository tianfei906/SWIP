%%% S. Pasquet - V16.8.23

%% A_SWIPdisp settings
% Main settings
% Remove intermediate files (=1) or store in file.dat (=0)
if exist('clearmem','var')==0 || isempty(clearmem)==1
    clearmem=1;
end

% Windowing and stacking settings (used if calc=1)
% Min. window size (nb of traces)
if exist('nWmin','var')==0 || isempty(nWmin)==1
    nWmin=21; 
end
% Max. window size (nb of traces)
if exist('nWmax','var')==0 || isempty(nWmax)==1
    nWmax=21; 
end
% Shift between two successive windows (nb of traces)
if exist('dW','var')==0 || isempty(dW)==1
    dW=1; 
end
% Offset min. between window and shot (nb of traces)
if exist('dSmin','var')==0 || isempty(dSmin)==1
    dSmin=1; 
end
% Offset max. between window and shot (nb of traces)
if exist('dSmax','var')==0 || isempty(dSmax)==1
    dSmax=5; 
end
% Source side (B=both, L=left, R=right)
if exist('side','var')==0 || isempty(side)==1
    side='L'; 
end

% P-omega transform settings (used if calc=1 or calc=2)
% Space scaling factor (X=X/xsca) (used if calc=1 or calc=2)
if exist('xsca','var')==0 || isempty(xsca)==1
    xsca=1; 
end
% Time scaling factor (T=T/xsca)
if exist('tsca','var')==0 || isempty(tsca)==1
    tsca=1; 
end
% Min. frequency for p-omega transform (Hz)
if exist('fmin','var')==0 || isempty(fmin)==1
    fmin=0; 
end
% Max. frequency for p-omega transform (Hz)
if exist('fmax','var')==0 || isempty(fmax)==1
    fmax=100; 
end
% Number of velocity samples for p-omega stack
if exist('nray','var')==0 || isempty(nray)==1
    nray=500; 
end
% Min. velocity for p-omega transform (m/s)
if exist('vmin','var')==0 || isempty(vmin)==1
    vmin=10; 
end
% Max. velocity for p-omega transform (m/s)
if exist('vmax','var')==0 || isempty(vmax)==1
    vmax=2000; 
end
% Vel. vs Freq. (=0) or Freq. vs Vel. (=1)
if exist('flip','var')==0 || isempty(flip)==1
    flip=1; 
end

% Filter and mute settings (used if calc=1)
% Use band pass filter (=1) or not (=0)
if exist('filt','var')==0 || isempty(filt)==1
    filt=0; 
end
% Low freq. cut (Hz) (used if filt=1)
if exist('fcutlow','var')==0 || isempty(fcutlow)==1
    fcutlow=1;
end
% High freq. cut (Hz) (used if filt=1)
if exist('fcuthigh','var')==0 || isempty(fcuthigh)==1
    fcuthigh=100;
end
% Apodisation taper (Hz) (used if filt=1)
if exist('taper','var')==0 || isempty(taper)==1
    taper=5;
end
% Use mute (=1) or not (=0)
if exist('mute','var')==0 || isempty(mute)==1
    mute=0;
end
% Mute before tmin1 at first trace (s) (used if mute=1)
if exist('tmin1','var')==0 || isempty(tmin1)==1
    tmin1=0;
end
% Mute before tmin2 at last trace (s) (used if mute=1)
if exist('tmin2','var')==0 || isempty(tmin2)==1
    tmin2=0;
end
% Mute after tmax1 at first trace (s) (used if mute=1)
if exist('tmax1','var')==0 || isempty(tmax1)==1
    tmax1=1;
end
% Mute after tmax2 at last trace (s) (used if mute=1)
if exist('tmax2','var')==0 || isempty(tmax2)==1
    tmax2=1;
end

% Dispersion picking settings
% Pick dispersion: manual (=1), auto (=2) or not (=0)
if exist('pick','var')==0 || isempty(pick)==1
    pick=1; 
end
% Colormap for picked dispersion image
if exist('mappick','var')==0 || isempty(mappick)==1
    mappick=parula(39); 
end
% Log colorscale for dispersion (=1) or linear (=0)
if exist('mappicklog','var')==0 || isempty(mappicklog)==1
    mappicklog=0; 
end
% Min. phase velocity sampling (m/s)
if exist('dvmin','var')==0 || isempty(dvmin)==1
    dvmin=5;
end
% First picked propagation mode (0 = fundamental)
if exist('modeinit','var')==0 || isempty(modeinit)==1
    modeinit=0; 
end
% Semi-automatic picking (=1) or manual (=0)
if exist('pickstyle','var')==0 || isempty(pickstyle)==1
    pickstyle=1; 
end
% Smooth picking (=1) or not (=0)
if exist('smoothpick','var')==0 || isempty(smoothpick)==1
    smoothpick=1; 
end

% Dispersion curves sampling settings
% Convert picks to dinver target (=1) or not (=0)
if exist('target','var')==0 || isempty(target)==1
    target=1; 
end
% Surface-wave type (R=Rayleigh or L=Love)
if exist('wave','var')==0 || isempty(wave)==1
    wave='R'; 
end
% Max. mode number saved in target file for inversion
if exist('maxmodeinv','var')==0 || isempty(maxmodeinv)==1
    maxmodeinv=[]; 
end
% Sampling in wavelength (1) or frequency (0)
if exist('sampling','var')==0 || isempty(sampling)==1
    sampling=1; 
end
% Resampling vector (wavelength [m] or frequency [Hz])
if exist('resampvec','var')==0 || isempty(resampvec)==1
    resampvec=(1:1:50); 
end
% Freq. low cut: user defined (=0) or amplitude threshold (=1)
if exist('freqlim','var')==0 || isempty(freqlim)==1
    freqlim=0;
end
% Min. picked frequency (Hz)
if exist('fminpick','var')==0 || isempty(fminpick)==1
    fminpick=7;
end
% Amplitude threshold (between 0 and 1) (used if freqlim=1)
if exist('specampmin','var')==0 || isempty(specampmin)==1
    specampmin=0.05;
end

% Error settings (used if target=1)
% No error (=0), Lorentz error (=1) or percentage error (=2)
if exist('err','var')==0 || isempty(err)==1
    err=1; 
end
% Adapt Lorentz error such as nW=nWfac*mean([nWmin,nWmax]) (used if err=1)
if exist('nWfac','var')==0 || isempty(nWfac)==1
    nWfac=1; 
end
% Min. vel. error for Lorentz (m/s) (used if err=1)
if exist('minerrvel','var')==0 || isempty(minerrvel)==1
    minerrvel=10; 
end
% Max. vel. error ratio for Lorentz (used if err=1)
if exist('maxerrrat','var')==0 || isempty(maxerrrat)==1
    maxerrrat=0.5; 
end
% Standard deviation error (%) (used if err=2)
if exist('sigma','var')==0 || isempty(sigma)==1
    sigma=15; 
end

% Plot settings
% Save stacked dispersion images (=1) or not (=0)
if exist('plotdisp','var')==0 || isempty(plotdisp)==1
    plotdisp=1; 
end
% Save stacked dispersion images with picked curves (=1) or not (=0)
if exist('plotpckdisp','var')==0 || isempty(plotpckdisp)==1
    plotpckdisp=1; 
end
% Save spectrograms (=1) or not (=0)
if exist('plotspec','var')==0 || isempty(plotspec)==1
    plotspec=1; 
end
% Save seismograms (=1) or not (=0)
if exist('plotseismo','var')==0 || isempty(plotseismo)==1
    plotseismo=1; 
end
% Save single images (=1) or not (=0)
if exist('plotsingle','var')==0 || isempty(plotsingle)==1
    plotsingle=0; 
end
% Save intermediate stacked dispersion images (=1) or not (=0)
if exist('plotstkdisp','var')==0 || isempty(plotstkdisp)==1
    plotstkdisp=0; 
end
% Plot picked dispersion on 1D single graph (=1) or not (=0)
if exist('plot1dobs','var')==0 || isempty(plot1dobs)==1
    plot1dobs=0; 
end
% Plot picked dispersion on 2D pseudo-section (=1) or not (=0)
if exist('plot2dobs','var')==0 || isempty(plot2dobs)==1
    plot2dobs=1; 
end
% Show images before saving (=1) or not (=0)
if exist('showplot','var')==0 || isempty(showplot)==1
    showplot=0; 
end

% General display settings
% Fig. file format ('pdf', 'png', 'jpeg', 'tiff' or 'fig')
if exist('imgform','var')==0 || isempty(imgform)==1
    imgform='png'; 
end
% Fig. resolution (dpi) when saving as raster
if exist('imgres','var')==0 || isempty(imgres)==1
    imgres=500; 
end
% Fig. font size (reduce by 40% with fs=40 => fs=16 in AI) (max=40)
if exist('fs','var')==0 || isempty(fs)==1
    fs=20; 
end
% Colorbar on the right (=1) or at the bottom (=2)
if exist('cbpos','var')==0 || isempty(cbpos)==1
    cbpos=1; 
end

%%% Dispersion image, spectrogram and seismogram settings
% Log colorscale for dispersion (=1) or linear (=0)
if exist('Dlogscale','var')==0 || isempty(Dlogscale)==1
    Dlogscale=1; 
end
% Logscale frequency axis (=1) or linear (=0)
if exist('Flogscale','var')==0 || isempty(Flogscale)==1
    Flogscale=0; 
end
% Plot Xaxis on top (=1) or bottom (=0)
if exist('axetop','var')==0 || isempty(axetop)==1
    axetop=1; 
end
% Yaxis pointing down (=1) or up (=0)
if exist('axerev','var')==0 || isempty(axerev)==1
    axerev=0; 
end
% Plot colorbar (=1) or not (=0)
if exist('cb_disp','var')==0 || isempty(cb_disp)==1
    cb_disp=0; 
end
% Plot errorbars (=1) or dots (=0) for picked dispersion
if exist('eb','var')==0 || isempty(eb)==1
    eb=1; 
end
% Picks color for even (0, 2,...) modes number (see ColorSpec)
if exist('pickcol1','var')==0 || isempty(pickcol1)==1
    pickcol1='w'; 
end
% Picks color for odd (1, 3,...) modes number (see ColorSpec)
if exist('pickcol2','var')==0 || isempty(pickcol2)==1
    pickcol2='w'; 
end
% Plot low cut frequency (=1) or not (=0)
if exist('plotflim','var')==0 || isempty(plotflim)==1
    plotflim=1; 
end

% Colormap for saved dispersion images and spectrograms
if exist('map0','var')==0 || isempty(map0)==1
    map0=bone(39); 
end
% Min. frequency to display (Hz)
if (exist('fMIN','var')==0 || isempty(fMIN)==1) || (exist('fMAX','var')==0 || isempty(fMAX)==1)
    fMIN=[]; 
end
% Max. frequency to display (Hz)
if (exist('fMIN','var')==0 || isempty(fMIN)==1) || (exist('fMAX','var')==0 || isempty(fMAX)==1)
    fMAX=[]; 
end
% Frequency ticks (Hz)
if exist('fticks','var')==0 || isempty(fticks)==1
    fticks=[]; 
end
% Min. phase velocity to display (m/s)
if (exist('VphMAX','var')==0 || isempty(VphMAX)==1) || (exist('VphMIN','var')==0 || isempty(VphMIN)==1)
    VphMIN=[]; 
end
% Max. phase velocity to display (m/s)
if (exist('VphMAX','var')==0 || isempty(VphMAX)==1) || (exist('VphMIN','var')==0 || isempty(VphMIN)==1)
    VphMAX=[]; 
end
% Phase velocity ticks (m/s)
if exist('Vphticks','var')==0 || isempty(Vphticks)==1
    Vphticks=[];
end
% Min. time to display (ms)
if (exist('tMIN','var')==0 || isempty(tMIN)==1) || (exist('tMAX','var')==0 || isempty(tMAX)==1)
    tMIN=[]; 
end
% Max. time to display (ms)
if (exist('tMIN','var')==0 || isempty(tMIN)==1) || (exist('tMAX','var')==0 || isempty(tMAX)==1)
    tMAX=[]; 
end
% Time ticks (ms)
if exist('tticks','var')==0 || isempty(tticks)==1
    tticks=[];
end    

% Phase velocity pseudo-section settings
% Colormap for phase velocity
if exist('map1','var')==0 || isempty(map1)==1
    map1=haxby(32);
end
% Min. X (m)
if (exist('xMIN','var')==0 || isempty(xMIN)==1) || (exist('xMAX','var')==0 || isempty(xMAX)==1)
    xMIN=[]; 
end
% Max. X (m)
if (exist('xMIN','var')==0 || isempty(xMIN)==1) || (exist('xMAX','var')==0 || isempty(xMAX)==1)
    xMAX=[]; 
end
% X ticks (m)
if exist('xticks','var')==0 || isempty(xticks)==1
    xticks=[];
end
% Min. wavelength (m)
if (exist('lamMIN','var')==0 || isempty(lamMIN)==1) || (exist('lamMAX','var')==0 || isempty(lamMAX)==1)
    lamMIN=[]; 
end
% Max. wavelength (m)
if (exist('lamMIN','var')==0 || isempty(lamMIN)==1) || (exist('lamMAX','var')==0 || isempty(lamMAX)==1)
    lamMAX=[]; 
end
% Wavelength ticks (m)
if exist('lticks','var')==0 || isempty(lticks)==1
    lticks=[];
end
% Min. Phase velocity (m/s)
if (exist('vphMIN','var')==0 || isempty(vphMIN)==1) || (exist('vphMAX','var')==0 || isempty(vphMAX)==1)
    vphMIN=[]; 
end
% Max. Phase velocity (m/s)
if (exist('vphMIN','var')==0 || isempty(vphMIN)==1) || (exist('vphMAX','var')==0 || isempty(vphMAX)==1)
    vphMAX=[]; 
end
% Phase velocity ticks (m/s)
if exist('vphticks','var')==0 || isempty(vphticks)==1
    vphticks=[];
end

%% B_SWIPparam settings
% Main settings
% Name of parameterization file (empty for autoname)
if exist('paramname','var')==0 || isempty(paramname)==1
    paramname=[]; 
end
% Type of parameterization
if exist('paramtype','var')==0 || isempty(paramtype)==1
    paramtype=0; 
end

% Parameter space settings
% Nb. of layers (including half-space)
if exist('nlay','var')==0 || isempty(nlay)==1
    nlay=11; 
end
% Nb. of sublayers per layer
if exist('nsublay','var')==0 || isempty(nsublay)==1
    nsublay=10; 
end
% Min. thickness per layer (m)
if exist('thmin','var')==0 || isempty(thmin)==1
    thmin=0.5; 
end
% Max. thickness per layer (m)
if exist('thmax','var')==0 || isempty(thmax)==1
    thmax=3; 
end

% Allow low velocity layer (=1) or not (=0) for each layer
if exist('lvz','var')==0 || isempty(lvz)==1
    lvz=0; 
end
% Shape of the velocity variation with depth for each layer
if exist('shape','var')==0 || isempty(shape)==1
    shape=1; 
end

% Min. Vs for each layer (m/s)
if exist('Vsmin','var')==0 || isempty(Vsmin)==1
    Vsmin=10; 
end
% Max. Vs for each layer (m/s)
if exist('Vsmax','var')==0 || isempty(Vsmax)==1
    Vsmax=2500; 
end
% Min. Vp for each layer (m/s)
if exist('Vpmin','var')==0 || isempty(Vpmin)==1
    Vpmin=10; 
end
% Max. Vp for each layer (m/s)
if exist('Vpmax','var')==0 || isempty(Vpmax)==1
    Vpmax=5000; 
end
% Min. Nu for each layer (kg/m3)
if exist('Numin','var')==0 || isempty(Numin)==1
    Numin=0.1; 
end
% Max. Nu for each layer (kg/m3)
if exist('Numax','var')==0 || isempty(Numax)==1
    Numax=0.5; 
end
% Min. Rho for each layer
if exist('Rhomin','var')==0 || isempty(Rhomin)==1
    Rhomin=1500; 
end
% Max. Rho for each layer
if exist('Rhomax','var')==0 || isempty(Rhomax)==1
    Rhomax=2500; 
end

% Vp linked (=1) or not (=0) to Vs for each layer
if exist('Vplink','var')==0 || isempty(Vplink)==1
    Vplink=1; 
end
% Nu linked (=1) or not (=0) to Vs for each layer
if exist('Nulink','var')==0 || isempty(Nulink)==1
    Nulink=1; 
end
% Rho linked (=1) or not (=0) to Vs for each layer
if exist('Rholink','var')==0 || isempty(Rholink)==1
    Rholink=1; 
end

% Automatic parameterization settings (used if paramtype~=0)
% Plot velocity models (=1) or not (=0)
if exist('plot2dVP','var')==0 || isempty(plot2dVP)==1
    plot2dVP=1; 
end
% Interpolation sampling in depth (m)
if exist('dz','var')==0 || isempty(dz)==1
    dz=0.2; 
end
% Average Vp along window width (=1) or extract at Xmid (=0)
if exist('vpaver','var')==0 || isempty(vpaver)==1
    vpaver=1; 
end
% Factor to increase velocity range (vmin-vfac*vmin<v<vmax+vfac*vmax)
if exist('vfac','var')==0 || isempty(vfac)==1
    vfac=0.25; 
end
% Link Vs LVZ with Vp LVZ (=1) or not (=0)
if exist('linklvz','var')==0 || isempty(linklvz)==1
    linklvz=0; 
end

%% C_SWIPinv settings
% Main settings
% Run inversion (=1) or not (=0)
if exist('inversion','var')==0 || isempty(inversion)==1
    inversion=1; 
end
% Build average models (=1) or not (=0)
if exist('calcmod','var')==0 || isempty(calcmod)==1
    calcmod=1; 
end

% Inversion settings (used if inversion=1)
% Nb of run
if exist('nrun','var')==0 || isempty(nrun)==1
    nrun=3; 
end
% Nb of iteration per run
if exist('itmax','var')==0 || isempty(itmax)==1
    itmax=100; 
end
% Nb of starting models
if exist('ns0','var')==0 || isempty(ns0)==1
    ns0=100; 
end
% Nb of models created at each iterations
if exist('ns','var')==0 || isempty(ns)==1
    ns=100; 
end
% Nb of previous models to build new sub-parameter space
if exist('nr','var')==0 || isempty(nr)==1
    nr=100; 
end
% Display inversion process (=1) or not (=0)
if exist('verbose','var')==0 || isempty(verbose)==1
    verbose=0; 
end

% Average models calculation settings (used if calcmod=1)
% Extract weighted model (=1) or not (=0) (experimental)
if exist('weightcalc','var')==0 || isempty(weightcalc)==1
    weightcalc=1;  
end
% Extract ridge model (=1) or not (=0) (experimental)
if exist('ridgecalc','var')==0 || isempty(ridgecalc)==1
    ridgecalc=1;  
end
% Select best models within error bars (=0) or nbest models per run (>0)
if exist('nbest','var')==0 || isempty(nbest)==1
    nbest=0; 
end
% Nb of points allowed to be out of the error bars before rejecting the model
if exist('outpoints','var')==0 || isempty(outpoints)==1
    outpoints=0; 
end

% Plot settings
% Plot inversion results (=1) or not (=0)
if exist('plotinvres','var')==0 || isempty(plotinvres)==1
    plotinvres=1; 
end
% Plot inversion parameters (=1) or not (=0)
if exist('plotparam','var')==0 || isempty(plotparam)==1
    plotparam=0; 
end
% Plot pseudo-2d Vs section (=1) or not (=0)
if exist('plot2dVS','var')==0 || isempty(plot2dVS)==1
    plot2dVS=1;  
end

% General display settings
% Fig. concatenation panel (=1) or not (=0)
if exist('concat','var')==0 || isempty(concat)==1
    concat=1;  
end
% Log colorscale (=1) or linear (=0)
if exist('Clogscale','var')==0 || isempty(Clogscale)==1
    Clogscale=1;  
end
% Colormap for misfit in
if exist('map2','var')==0 || isempty(map2)==1
    map2=hsv(16); 
end
% Colormap for misfit out
if exist('map3','var')==0 || isempty(map3)==1
    map3=graycm(16);  
end
% Number of columns for figure panels
if exist('colnb','var')==0 || isempty(colnb)==1
    colnb=3;  
end

% Calculated models and parameters display settings (used if plotinvres=1)
% Plot final 1D Vs model with all calculated models (=1) or not (=0)
if exist('plot1dVS','var')==0 || isempty(plot1dVS)==1
    plot1dVS=1; 
end
% 1D Vs model to plot (1=best, 2=layered, 3=smooth, 4=smlay and 5=ridge)
if exist('modeltype','var')==0 || isempty(modeltype)==1
    modeltype=2; 
end
% Mean model (=0) or weighted model (=1)
if exist('avertype','var')==0 || isempty(avertype)==1
    avertype=0; 
end

% Min. depth (m)
if (exist('dpMIN','var')==0 || isempty(dpMIN)==1) || (exist('dpMAX','var')==0 || isempty(dpMAX)==1)
    dpMIN=[]; 
end
% Max. depth (m)
if (exist('dpMIN','var')==0 || isempty(dpMIN)==1) || (exist('dpMAX','var')==0 || isempty(dpMAX)==1)
    dpMAX=[]; 
end
% Depth ticks (m)
if exist('dticks','var')==0 || isempty(dticks)==1
    dticks=[]; 
end
% Min. Vs (m/s)
if (exist('vsMIN','var')==0 || isempty(vsMIN)==1) || (exist('vsMAX','var')==0 || isempty(vsMAX)==1)
    vsMIN=[]; 
end
% Max. Vs (m/s)
if (exist('vsMIN','var')==0 || isempty(vsMIN)==1) || (exist('vsMAX','var')==0 || isempty(vsMAX)==1)
    vsMAX=[]; 
end
% Vs ticks (m/s)
if exist('vsticks','var')==0 || isempty(vsticks)==1
    vsticks=[]; 
end
% Min. Vp (m/s)
if (exist('vpMIN','var')==0 || isempty(vpMIN)==1) || (exist('vpMAX','var')==0 || isempty(vpMAX)==1)
    vpMIN=[]; 
end
% Max. Vp (m/s)
if (exist('vpMIN','var')==0 || isempty(vpMIN)==1) || (exist('vpMAX','var')==0 || isempty(vpMAX)==1)
    vpMAX=[]; 
end
% VP ticks (m/s)
if exist('vpticks','var')==0 || isempty(vpticks)==1
    vpticks=[]; 
end
% Min. Rho (kg/m3)
if (exist('rhoMIN','var')==0 || isempty(rhoMIN)==1) || (exist('rhoMAX','var')==0 || isempty(rhoMAX)==1)
    rhoMIN=[]; 
end
% Max. Rho (kg/m3)
if (exist('rhoMIN','var')==0 || isempty(rhoMIN)==1) || (exist('rhoMAX','var')==0 || isempty(rhoMAX)==1)
    rhoMAX=[]; 
end
% Rho ticks (kg/m3)
if exist('rhoticks','var')==0 || isempty(rhoticks)==1
    rhoticks=[]; 
end

% Parameters to plot ('Vs', 'Th', 'Vp', 'Dens') (used if plotparam=1)
% First parameter
if exist('param1','var')==0 || isempty(param1)==1
    param1='Vs'; 
end
% Second parameter
if exist('param2','var')==0 || isempty(param2)==1
    param2='Th'; 
end
% Vector of first parameter
if exist('np1','var')==0 || isempty(np1)==1
    np1=(1:2); 
end
% Vector of second parameter
if exist('np2','var')==0 || isempty(np2)==1
    np2=(1:2); 
end

%% D1_SWIPmod1d
% Main settings
% Use velocity models obtained from SWIP (=1) or not (=0)
if exist('swip','var')==0 || isempty(swip)==1
    swip=1; 
end
% Use velocity models obtained from P- and SH-wave tomography (=1) or not (=0)
if exist('tomo','var')==0 || isempty(tomo)==1
    tomo=0; 
end
% Use velocity models defined in the script (=1) or select gpdc file (=2)
if exist('user','var')==0 || isempty(user)==1
    user=0; 
end

% SWIP model settings (used if swip=1)
% Use Vp from tomography (=1) or from SW inversion (=0)
if exist('usevptomo','var')==0 || isempty(usevptomo)==1
    usevptomo=0; 
end

% User defined 1D model parameters (used if user=1)
% Vp (m/s)
if exist('vpuser','var')==0 || isempty(vpuser)==1
    vpuser=[400,800,4000];  
end
% Vs (m/s)
if exist('vsuser','var')==0 || isempty(vsuser)==1
    vsuser=[150,300,1000]; 
end
% Rho (kg/m3)
if exist('rhouser','var')==0 || isempty(rhouser)==1
    rhouser=[1800,1800,1800]; 
end
% Thickness (m)
if exist('thkuser','var')==0 || isempty(thkuser)==1
    thkuser=[1,3]; 
end

% Plot settings
% Plot dispersion images with calculated dispersion curves (=1) or not (=0)
if exist('plot1dcal','var')==0 || isempty(plot1dcal)==1
    plot1dcal=1; 
end
% Plot Vs, Vp, Vp/Vs and Poisson's ratio 1D models (=1) or not (=0)
if exist('plot1dmod','var')==0 || isempty(plot1dmod)==1
    plot1dmod=1; 
end

% Dispersion curves and images settings
% Nb of mode for forward calculation
if exist('nmodemax','var')==0 || isempty(nmodemax)==1
    nmodemax=5; 
end
% Plot observed dispersion curves (=1) or not (=0)
if exist('plot1dobs','var')==0 || isempty(plot1dobs)==1
    plot1dobs=1; 
end

% Vs, Vp, Vp/Vs and Poisson's ratio 1D models settings
% Plot STD enveloppe (=1), percentage error (=2) or none (=0)
if exist('plot1dstd','var')==0 || isempty(plot1dstd)==1
    plot1dstd=1; 
end
% Plot 1D Vp models with 1D Vs models (=1) or not (=0)
if exist('plot1dvp','var')==0 || isempty(plot1dvp)==1
    plot1dvp=0; 
end
% Plot DOI estimated from wavelength (=1), from VsSTD (=2) or not (=0)
if exist('plotDOI','var')==0 || isempty(plotDOI)==1
    plotDOI=0; 
end
% DOI factor (DOI = Lmax*fact)
if exist('fact','var')==0 || isempty(fact)==1
    doifact=0.66; 
end
% Percentage error on velocity models (in %) (0 to use STD from SWIP)
if exist('errstd','var')==0 || isempty(errstd)==1
    errstd=0; 
end

% Min Vp/Vs
if (exist('vpvsMIN','var')==0 || isempty(vpvsMIN)==1) || (exist('vpvsMAX','var')==0 || isempty(vpvsMAX)==1)
    vpvsMIN=[];
end
% Max Vp/Vs
if (exist('vpvsMIN','var')==0 || isempty(vpvsMIN)==1) || (exist('vpvsMAX','var')==0 || isempty(vpvsMAX)==1)
    vpvsMAX=[]; 
end
% Vp/Vs ticks
if exist('vpvsticks','var')==0 || isempty(vpvsticks)==1
    vpvsticks=[]; 
end
% Min Poisson's ratio
if (exist('poisMAX','var')==0 || isempty(poisMAX)==1) || (exist('poisMIN','var')==0 || isempty(poisMIN)==1)
    poisMIN=[]; 
end
% Max Poisson's ratio
if (exist('poisMAX','var')==0 || isempty(poisMAX)==1) || (exist('poisMIN','var')==0 || isempty(poisMIN)==1)
    poisMAX=[]; 
end
% Poisson's ratio ticks
if exist('poisticks','var')==0 || isempty(poisticks)==1
    poisticks=[]; 
end

%% D2_SWIPmod2d
% Plot and save settings
% Plot calculated Vphase 2D section (=1) or not (=0)
if exist('plot2dcal','var')==0 || isempty(plot2dcal)==1
    plot2dcal=1;  
end
% Plot residual histograms (=1) or not (=0)
if exist('plothisto','var')==0 || isempty(plothisto)==1
    plothisto=1;  
end
% Plot Vs, Vp, Rho, VsStd, Vp/Vs and Poisson's ratio 2D section (=1) or not (=0)
if exist('plot2dmod','var')==0 || isempty(plot2dmod)==1
    plot2dmod=1; 
end
% Plot electrical resistivity 2D section (=1) or not (=0)
if exist('plot2dert','var')==0 || isempty(plot2dert)==1
    plot2dert=0; 
end
% Save 2D models in .xzv ASCII file (=1) or not (=0)
if exist('savexzv','var')==0 || isempty(savexzv)==1
    savexzv=1; 
end

% Phase velocity and residuals pseudo-section settings
% Colormap for phase velocity residuals
if exist('map4','var')==0 || isempty(map4)==1
    map4=haxby(32);
end
% Minimum residual (m/s)
if (exist('residMIN','var')==0 || isempty(residMIN)==1) || (exist('residMAX','var')==0 || isempty(residMAX)==1)
    residMIN=[]; 
end
% Maximum residual (m/s)
if (exist('residMIN','var')==0 || isempty(residMIN)==1) || (exist('residMAX','var')==0 || isempty(residMAX)==1)
    residMAX=[]; 
end
% Residual ticks (m/s)
if exist('residticks','var')==0 || isempty(residticks)==1
    residticks=[]; 
end

% Vs, Vp, Vp/Vs and Poisson's ratio pseudo-section settings
% Blocky (=0), smooth interp (=1) or smooth contour (=2) images
if exist('blocky','var')==0 || isempty(blocky)==1
    blocky=0; 
end
% Vertical exageration
if exist('vertex','var')==0 || isempty(vertex)==1
    vertex=1; 
end
% Plot topo profile on 2D sections (=1) or not (=0)
if exist('plottopo','var')==0 || isempty(plottopo)==1
    plottopo=1; 
end
% Mask below DOI (=1) or plot down to MAXdepth (=0)
if exist('maskDOI','var')==0 || isempty(maskDOI)==1
    maskDOI=2; 
end
% Colormap for Vp, Vs and Rho
if exist('map5','var')==0 || isempty(map5)==1
    map5=haxby(32); 
end
% Colormap for Vp/Vs and Poisson's ratio
if exist('map6','var')==0 || isempty(map6)==1
    map6=haxby(32);
end

% Min altitude (m)
if (exist('zMAX','var')==0 || isempty(zMAX)==1) || (exist('zMIN','var')==0 || isempty(zMIN)==1)
    zMIN=[]; 
end
% Max altitude (m)
if (exist('zMAX','var')==0 || isempty(zMAX)==1) || (exist('zMIN','var')==0 || isempty(zMIN)==1)
    zMAX=[]; 
end
% Altitude ticks (m)
if exist('zticks','var')==0 || isempty(zticks)==1
    zticks=[]; 
end
% Min StdVs (m/s)
if (exist('stdMIN','var')==0 || isempty(stdMIN)==1) || (exist('stdMAX','var')==0 || isempty(stdMAX)==1)
    stdMIN=0; 
end
% Max STdVs (m/s)
if (exist('stdMIN','var')==0 || isempty(stdMIN)==1) || (exist('stdMAX','var')==0 || isempty(stdMAX)==1)
    stdMAX=200; 
end
% Vs STD ticks (m/s)
if exist('stdticks','var')==0 || isempty(stdticks)==1
    stdticks=[]; 
end

% Colormap for electrical resistivity
if exist('map7','var')==0 || isempty(map7)==1
    map7=haxby(32); 
end
% Min resistivity
if (exist('resMAX','var')==0 || isempty(resMAX)==1) || (exist('resMIN','var')==0 || isempty(resMIN)==1)
    resMIN=[]; 
end
% Max resistivity
if (exist('resMAX','var')==0 || isempty(resMAX)==1) || (exist('resMIN','var')==0 || isempty(resMIN)==1)
    resMAX=[]; 
end
% Resistivity ticks
if exist('resticks','var')==0 || isempty(resticks)==1
    resticks=[]; 
end

% Vs isocontours (m/s)
if exist('vsISO','var')==0 || isempty(vsISO)==1
    vsISO=[]; 
end
% Vp isocontours (m/s)
if exist('vpISO','var')==0 || isempty(vpISO)==1
    vpISO=[]; 
end
% STdVs isocontours (m/s)
if exist('stdISO','var')==0 || isempty(stdISO)==1
    stdISO=[]; 
end
% Vp/Vs isocontours
if exist('vpvsISO','var')==0 || isempty(vpvsISO)==1
    vpvsISO=[]; 
end
% Poisson's ratio isocontours
if exist('poisISO','var')==0 || isempty(poisISO)==1
    poisISO=[]; 
end
% Resistivity isocontours (Ohm.m)
if exist('resISO','var')==0 || isempty(resISO)==1
    resISO=[]; 
end