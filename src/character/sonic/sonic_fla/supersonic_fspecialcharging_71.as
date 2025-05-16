// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//sonic_fla.supersonic_fspecialcharging_71

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

    public dynamic class supersonic_fspecialcharging_71 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var waiting:*;
        public var effect:*;

        public function supersonic_fspecialcharging_71()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 8, this.frame9, 9, this.frame10, 39, this.frame40, 80, this.frame81, 89, this.frame90);
        }

        public function afterImage():void
        {
            this.effect = this.self.attachEffect("super_sonic_afterimage");
            this.self.applyPalette(this.effect);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.waiting = false;
                this.effect = null;
            };
        }

        internal function frame3():*
        {
            this.xframe = "charging";
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            this.xframe = "attack";
            this.waiting = true;
            this.self.playAttackSound(2);
            SSF2API.createTimer(this.self, 1, 0, this.afterImage);
        }

        internal function frame40():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame81():*
        {
            this.waiting = false;
            this.self.playAttackSound(3);
            SSF2API.destroyTimer(this.self, this.afterImage);
        }

        internal function frame90():*
        {
            this.self.endAttack();
        }


    }
}//package sonic_fla

