// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_DSmash_30

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

    public dynamic class Bomberman_DSmash_30 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var xframe:String;
        public var self:*;

        public function Bomberman_DSmash_30()
        {
            addFrameScript(0, this.frame1, 4, this.frame5, 10, this.frame11, 15, this.frame16, 16, this.frame17, 23, this.frame24, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.xframe = null;
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame5():*
        {
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            gotoAndPlay("charging");
        }

        internal function frame16():*
        {
            SSF2API.shakeCamera(8);
        }

        internal function frame17():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame24():*
        {
            this.xframe = "attack";
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

