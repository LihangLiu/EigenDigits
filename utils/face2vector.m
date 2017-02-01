function [ v ] = face2vector( faces )
% face: (w,h,k)

    [w,h,k] = size(faces);
    v = reshape(faces,w*h,k);

end

