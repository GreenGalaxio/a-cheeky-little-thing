// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.bomberman_fs_intro_73

package bomberman_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.globalization.*;
    import flash.net.*;
    import flash.net.drm.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.sampler.*;
    import flash.sensors.*;
    import flash.system.*;
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class bomberman_fs_intro_73 extends MovieClip 
    {

        public var timeLeft:Number;
        public var controls:Object;
        public var target:*;
        public var cpuUP:Boolean;
        public var self:*;
        public var cam:*;
        public var yTeleport:*;
        public var xTeleport:*;
        public var firstTime:*;

        public function bomberman_fs_intro_73()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 27, this.frame28, 36, this.frame37, 64, this.frame65, 65, this.frame66, 69, this.frame70, 70, this.frame71, 74, this.frame75, 75, this.frame76, 79, this.frame80, 80, this.frame81, 81, this.frame82, 82, this.frame83, 97, this.frame98);
        }

        public function dropPower():*
        {
            this.self.fireProjectile("bigFSbomb", true);
        }

        public function dropNormal():*
        {
            this.self.fireProjectile("FSbomb", true);
            this.self.getCurrentProjectile().updateProjectileStats({"maxgravity":13});
            this.self.getCurrentProjectile().updateAttackBoxStats(1, {"damage":3});
        }

        public function dropBig():*
        {
            this.self.fireProjectile("FSbomb", true);
            this.self.getCurrentProjectile().updateProjectileStats({"maxgravity":16});
            this.self.getCurrentProjectile().updateAttackBoxStats(1, {"damage":6});
        }

        internal function frame1():*
        {
            this.timeLeft = (30 * 10);
            this.controls = null;
            this.target = null;
            this.cpuUP = false;
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame28():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame37():*
        {
            this.cam = SSF2API.getCamBounds();
            this.yTeleport = (this.cam.y + 100);
            this.xTeleport = (this.cam.x + (this.cam.width / 2));
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":0
            });
            this.self.setX(this.xTeleport);
            this.self.setY(this.yTeleport);
        }

        internal function frame65():*
        {
            this.self.playAttackSound(3);
            this.firstTime = true;
        }

        internal function frame66():*
        {
            if (this.firstTime)
            {
                this.dropNormal();
            };
        }

        internal function frame70():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame71():*
        {
            this.dropBig();
        }

        internal function frame75():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame76():*
        {
            this.dropPower();
        }

        internal function frame80():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame81():*
        {
            this.timeLeft = (this.timeLeft - 15);
            this.firstTime = false;
            if (this.timeLeft <= 0)
            {
                gotoAndPlay("finish");
            }
            else
            {
                gotoAndPlay("loop");
            };
        }

        internal function frame82():*
        {
            this.self.updateAttackStats({"allowControl":false});
        }

        internal function frame83():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame98():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

