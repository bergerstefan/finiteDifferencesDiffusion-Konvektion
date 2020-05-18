classdef UnitGrid < handle
    properties
        n
        h
        x
        y
        z
        Bup
        Bdown
        Bleft
        Bright
    end
    methods
        function obj = UnitGrid(n)
            obj.n = n;
            obj.h = 1/(n);
            obj.x = 0:obj.h:1;
            obj.y = 0:obj.h:1;
            for i=1:n
                for j=1:n
                    obj.z(i,j) = 0;
                end
            end
        end
        function setValue(obj,i,j,value)
            obj.z(i,j) = value;
        end
        function setBoundryCondtion(obj, Border, BC)
            
            if Border == "Bleft"
                for i=1:obj.n+1
                    obj.z(i,1) = BC(i * obj.h, 0);
                    obj.Bleft(i) = BC(i * obj.h, 0);
                end
            end
            if Border == "Bright"
                for i=1:obj.n+1
                    obj.z(i,obj.n) = BC(i * obj.h, 1);
                    obj.Bright(i)  = BC(i * obj.h, 1);
                end
            end
            if Border == "Bup"
                for i=1:obj.n +1
                    obj.z(1,i) = BC(0,obj.h*i);
                    obj.Bup(i) = BC(0,obj.h*i);
                end
            end
            if Border == "Bdown"
                for i=1:obj.n +1
                    obj.z(obj.n,i) = BC(1,obj.h*i);
                    obj.Bdown(i) = BC(1,obj.h*i);
                end
            end
        end
    end
    
    
end



