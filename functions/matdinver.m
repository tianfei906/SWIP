function status=matdinver(targetfile,paramfile,nrun,itmax,ns0,ns,nr,dir_out,verbose)

% S. Pasquet - V16.6.22

% matdinver execute dinver inversion through matlab
% targetfile = name of the file containing dispersion curves
% paramfile = name of the file containing the parameter space
% nrun = Nb of run
% itmax = Nb of iteration per run
% ns0 = Nb of starting models
% ns = Nb of models created at each iterations
% nr = Nb of previous models used to build new sub-parameter space for the
% next ns models

for j=1:nrun
    fprintf(['\n      Run ',num2str(j),'\n']);
    com1=['dinver -i DispersionCurve -optimization -target ',targetfile,...
        ' -param ',paramfile,' -itmax ',num2str(itmax),' -ns0 ',...
        num2str(ns0),' -ns ',num2str(ns),' -nr ',num2str(nr),' -f -nobugreport -o ',...
        fullfile(dir_out,['run_0',num2str(j),'.report'])];
    if verbose==0
        [status,~]=unix(com1);
    else
        [status]=unix(com1);
    end
    if status~=0
        [status,din_err]=unix(com1);
        if isempty(strfind(din_err,'parameters'))==0
            fprintf('\n  !!!!!!!!!!!!!!!!!!!!!');
            fprintf('\n   Invalid .param file');
            fprintf('\n     Go to next Xmid');
            fprintf('\n  !!!!!!!!!!!!!!!!!!!!!\n\n');
        elseif isempty(strfind(din_err,'target'))==0
            fprintf('\n  !!!!!!!!!!!!!!!!!!!!!!');
            fprintf('\n   Invalid .target file');
            fprintf('\n     Go to next Xmid');
            fprintf('\n  !!!!!!!!!!!!!!!!!!!!!!\n\n');   
        end
        break
    end
end