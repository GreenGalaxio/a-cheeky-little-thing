// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.sonic_dsmash_145

package sonic_fla
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

    public dynamic class sonic_dsmash_145 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:*;

        public function sonic_dsmash_145()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 12, this.frame13, 13, this.frame14, 17, this.frame18, 23, this.frame24, 32, this.frame33, 35, this.frame36);
        }

        public function afterImage():void
        {
            this.self.attachEffect("sonic_afterimage1");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame7():*
        {
            this.xframe = "charging";
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame14():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            SSF2API.createTimer(this.self, 1, 18, this.afterImage);
            this.self.setXSpeed(20, false);
        }

        internal function frame18():*
        {
            this.self.setXSpeed(-26, false);
        }

        internal function frame24():*
        {
            this.self.setXSpeed(16, false);
        }

        internal function frame33():*
        {
            this.self.setXSpeed(0, false);
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

