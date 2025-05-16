// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//bomberman_fla.Bomberman_FSmash_23

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

    public dynamic class Bomberman_FSmash_23 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var xframe:String;

        public function Bomberman_FSmash_23()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 10, this.frame11, 14, this.frame15, 32, this.frame33);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
            };
        }

        internal function frame6():*
        {
            this.xframe = null;
            this.xframe = "charging";
        }

        internal function frame11():*
        {
            gotoAndPlay("charging");
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame33():*
        {
            this.self.endAttack();
        }


    }
}//package bomberman_fla

