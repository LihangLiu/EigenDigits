function [ faces ] = vector2face( v, w, h )
% v: (w*h, k), vector
% w: width
% h: height

    [x, k] = size(v);
    if x ~= w*h
        sprintf('dimensions dont match');
    end
    
    faces = reshape(v,w,h,k);
end

