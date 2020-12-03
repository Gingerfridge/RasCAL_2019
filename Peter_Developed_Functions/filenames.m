folder = 'C:\Users\mbcx4ph5\Dropbox (The University of Manchester)\PhD\CSF - Manchester\Computational Work\Gromacs\Job_42_Fab_Surface\Analysis';
extension = 'xvg';

d = dir([folder filesep '*.' extension]);
filenames = {d.name};