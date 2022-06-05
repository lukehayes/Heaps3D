import hxd.Key in K;
import h3d.scene.World;
import h3d.scene.*;

class Main extends hxd.App {

    var world : h3d.scene.World;
    var shadow :h3d.pass.DefaultShadowMap;
    var tf : h2d.Text;
    var c : Float = 0.0;
    var prim : h3d.prim.Cube;
    var obj : h3d.scene.Mesh;

    override function init() {
        //world = new World(16,100);

        this.prim = new h3d.prim.Cube();
        prim.translate( -0.5, -0.5, -0.5);
        var tex = hxd.Res.hxlogo.toTexture();
        var mat = h3d.mat.Material.create(tex);
        obj = new h3d.scene.Mesh(prim, mat, s3d);

        // unindex the faces to create hard edges normals
        prim.unindex();

        // add face normals
        prim.addNormals();

        // add texture coordinates
        prim.addUVs();

        //for( i in 0...1000 )
            ////world.add(Std.random(2) == 0 ? t : r, Math.random() * 128, Math.random() * 128, 0, 1.2 + hxd.Math.srand(0.4), hxd.Math.srand(Math.PI));
            ////world.add(obj, Math.random() * 128, Math.random() * 128, 0, 1.2 + hxd.Math.srand(0.4), hxd.Math.srand(Math.PI));

        //world.done();

        //
        new h3d.scene.fwd.DirLight(new h3d.Vector( 0.3, -0.4, -0.9), s3d);
        cast(s3d.lightSystem,h3d.scene.fwd.LightSystem).ambientLight.setColor(0x909090);

        //s3d.camera.target.set(72, 72, 0);
        //s3d.camera.pos.set(120, 120, 40);

        shadow = s3d.renderer.getPass(h3d.pass.DefaultShadowMap);
        shadow.size = 2048;
        shadow.power = 200;
        shadow.blur.radius= 0;
        shadow.bias *= 0.1;
        shadow.color.set(0.7, 0.7, 0.7);


        //
        //var parts = new h3d.parts.GpuParticles(world);
        //var g = parts.addGroup();
        //g.size = 0.2;
        //g.gravity = 1;
        //g.life = 10;
        //g.nparts = 10000;
        //g.emitMode = CameraBounds;
        //parts.volumeBounds = h3d.col.Bounds.fromValues( -20, -20, 15, 40, 40, 40);

        s3d.camera.zNear = 1;
        s3d.camera.zFar = 100;
        new h3d.scene.CameraController(s3d).loadFromCamera();

        tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
    }

    override function update(dt:Float) {
        tf.text = ""+engine.drawCalls;
        c += 0.1;
        obj.y = Math.sin(c);
        obj.rotate(Math.sin(c) / 10.0, Math.cos(c) / 10.0, Math.sin(c) / 10.0);
        //prim.translate( -0.5, -Math.sin(c) * 100.0, -0.5);
    }

    static function main() {
        hxd.Res.initEmbed();
        new Main();
    }

}






