function filenames = files_mat()

folder = pwd;
extension = 'mat';

d = dir([folder filesep '*.' extension]);
filenames = {d.name};
