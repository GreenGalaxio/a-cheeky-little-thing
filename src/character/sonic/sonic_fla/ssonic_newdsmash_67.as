// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.ssonic_newdsmash_67

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

    public dynamic class ssonic_newdsmash_67 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:*;

        public function ssonic_newdsmash_67()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 5, this.frame6, 6, this.frame7, 11, this.frame12, 12, this.frame13, 20, this.frame21, 22, this.frame23, 27, this.frame28, 29, this.frame30);
        }

        public function afterImage():void
        {
            this.self.attachEffect("super_sonic_afterimage");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
        }

        internal function frame4():*
        {
            this.xframe = "charging";
            this.self.playAttackSound(1);
        }

        internal function frame6():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame7():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            SSF2API.createTimer(this.self, 1, 18, this.afterImage);
            this.self.setXSpeed(40, false);
        }

        internal function frame12():*
        {
            this.self.updateAttackBoxStats(1, {"direction":150});
        }

        internal function frame13():*
        {
            this.self.setXSpeed(-70, false);
        }

        internal function frame21():*
        {
            this.self.setXSpeed(33, false);
        }

        internal function frame23():*
        {
            this.self.updateAttackBoxStats(1, {"direction":30});
        }

        internal function frame28():*
        {
            this.self.setXSpeed(0, false);
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

