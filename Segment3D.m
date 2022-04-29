function [segments] =Segment3D(lx,ly)
segments=[%socle du bas
          lx/2 ly/2 1;lx/2+200 ly/2 1;lx/2+200 ly/2 1;lx/2+200 ly/2-200 1;lx/2+200 ly/2-200 1;
          lx/2 ly/2-200 1;lx/2 ly/2-200 1;lx/2 ly/2 1;
          %socle du haut
          lx/2 ly/2 800;lx/2+200 ly/2 800;lx/2+200 ly/2 800;lx/2+200 ly/2-200 800;lx/2+200 ly/2-200 800;
          lx/2 ly/2-200 800;lx/2 ly/2-200 800;lx/2 ly/2 800;
          %relier les points
          lx/2 ly/2 1;lx/2 ly/2 800;lx/2+200 ly/2 1;lx/2+200 ly/2 800;lx/2+200 ly/2-200 1;lx/2+200 ly/2-200 800;
          lx/2 ly/2-200 1;lx/2 ly/2-200 800;
          %deuxième socle bas
          lx/2+60 ly/2-60 800;lx/2+140 ly/2-60 800;lx/2+140 ly/2-60 800;lx/2+140 ly/2-140 800;lx/2+140 ly/2-140 800;
          lx/2+60 ly/2-140 800;lx/2+60 ly/2-140 800;lx/2+60 ly/2-60 800;
          %deuxieme socle haut
          lx/2+60 ly/2-60 1100;lx/2+140 ly/2-60 1100;lx/2+140 ly/2-60 1100;lx/2+140 ly/2-140 1100;lx/2+140 ly/2-140 1100;
          lx/2+60 ly/2-140 1100;lx/2+60 ly/2-140 1100;lx/2+60 ly/2-60 1100;
          %relier les deuxieme points
          lx/2+60 ly/2-60 800;lx/2+60 ly/2-60 1100;lx/2+140 ly/2-60 800;lx/2+140 ly/2-60 1100;lx/2+140 ly/2-140 800;lx/2+140 ly/2-140 1100;
          lx/2+60 ly/2-140 800;lx/2+60 ly/2-140 1100;
          ];

end
          