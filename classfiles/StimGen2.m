classdef StimGen2
    properties(Constant)
        RGB=struct('R', 1, 'G', 2,'B', 3);
    end
    
    properties (Hidden)
        colorLevels
        yblk
    end
    % The following properties can be set only by class methods
    properties
%         dir_out='/Volumes/Datos/Movies/Ecovision_stim/stim_calibration/B0';
%         dir_in='/Volumes/Datos/Movies/Ecovision_stim/stim_calibration';
%         sizeout=800;
%         sizein=600;
%         colout_basal=[0 0 0];
%         framerate=60;
%         reds=[64 160 256]/256;
%         h_red=50;
%         %%%%%%%%%%%%%%%%%  COLORS  %%%%%%%%%%%%%%%
%         color_levels=0:.5/4:1;
%         bak_frames=180; %frams
%         stim_duration=100; %frames
        
    end
    
    properties
        StimStruc
        StimSequence
        RedSequence
        Color
    end
    
    methods
        %Constructor
        function SG = StimGen(InitialStim,InitialSequence,color)
            SG.Color=color; %B or G
            SG.StimStruc = InitialStim;
            SG.StimSequence = InitialSequence;
            SG.RedSequence=gen_red_bar_sequence(InitialStim,InitialSequence);
            SG.yblk=generate_RGB_rectangle_image(InitialStim.sizeout-InitialStim.h_red,InitialStim.sizeout,InitialStim.colout_basal);
            
        end
    end
    methods
        function gen_stims_images(SG,imageTimeIndex)
            
            
        end
        
        function RedSeq=gen_red_bar_sequence(set,seq)
            st=set.reds;
            x=length(st);
            z=kron(ones(1,ceil(length(seq)/x)),st);
            RedSeq=z(1:length(seq));
            
        end
        
        function stims_images(SG)
            
        end
        function add_red_bar(SG)
            
            
        end
    end % methods
end % classdef