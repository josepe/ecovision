classdef ImagBasal
    properties(Constant)
        RGB=struct('R', 1, 'G', 2,'B', 3);
       
    end
    
    properties (Hidden)
        colorLevels
        yblk
    end
        
    properties
        Path
        Color
        ID
        NivelColor
        Side
        param
        SA
        SB
    end
    
    methods
        
        function IB = ImagBasal(param,ident)
         IB.param=param;
         IB.NivelColor=
         IB.Path=[param.dir_base param.dir_im];
         IB.ID=ident;
         IB.Side=param.side;
         IB.Color=param.colores_basal(ident);
         IM.SG=param.G;
         IM.SB=param.B;
        end %Constructor
        
        function computePa
            
         
        
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         SG.RedSequence=SG.gen_red_bar_sequence(InitialStim,InitialSequence);
         SG.yblk=generate_RGB_rectangle_image(InitialStim.sizeout-InitialStim.h_red,InitialStim.sizeout,InitialStim.colout_basal);
            
        end
            
    end % methods
    
end % classdef