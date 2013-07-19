classdef StimGen
    properties(Constant)
        RGB=struct('R', 1, 'G', 2,'B', 3);
    end
    
    properties (Hidden)
        colorLevels
        yblk
    end
    % The following properties can be set only by class methods
  
    
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