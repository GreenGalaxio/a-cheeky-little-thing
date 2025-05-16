// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megamanknuckle_37

package megaman_fla
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

    public dynamic class megamanknuckle_37 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;

        public function megamanknuckle_37()
        {
            addFrameScript(0, this.frame1, 13, this.frame14, 18, this.frame19, 19, this.frame20, 27, this.frame28);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
        }

        internal function frame14():*
        {
            this.xframe = "charging";
        }

        internal function frame19():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame20():*
        {
            this.xframe = "attack";
            this.self.fireProjectile("megaman_hardknuckle");
            this.self.playAttackSound(1);
            this.self.playAttackSound(2);
            this.self.setXSpeed(-5, false);
        }

        internal function frame28():*
        {
            this.self.endAttack();
        }


    }
}//package megaman_fla

