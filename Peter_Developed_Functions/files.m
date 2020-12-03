function filenames = files()

folder = pwd;
extension = 'xvg';

d = dir([folder filesep '*.' extension]);
filenames = {d.name};

