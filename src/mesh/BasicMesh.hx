package mesh;

import h3d.scene.Scene;
import h3d.scene.Mesh;
import h3d.prim.Cube;
import h3d.mat.Material;

/**
  Wrapper for a simple mesh that includes all of the
  generation needed to create itself and add it
  to a scene.
  **/
class BasicMesh
{
    public var mesh : Mesh;

    var primitive : Cube;
    var material  : Material;


    public function new(scene: Scene)
    {
        this.primitive = new Cube();
        this.material = Material.create(
                hxd.Res.hxlogo.toTexture()
               );

        this.mesh = new Mesh(primitive, material, scene);

        // unindex the faces to create hard edges normals
        primitive.unindex();

        // add face normals
        primitive.addNormals();

        // add texture coordinates
        primitive.addUVs();
    }
}
