// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_downsmash_special_44

package naruto_fla
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

    public dynamic class naruto_downsmash_special_44 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function naruto_downsmash_special_44()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 5, this.frame6, 6, this.frame7, 12, this.frame13, 22, this.frame23);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = null;
            if (((this.self) && (SSF2API.isReady())))
            {
                this.self.playVoiceSound(1);
            };
        }

        internal function frame2():*
        {
            this.xframe = "charging";
        }

        internal function frame5():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame6():*
        {
            this.xframe = "attack";
            SSF2API.playSound("JPN_naruto_dead1", true);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame13():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "direction":45,
                "power":60,
                "kbConstant":70,
                "damage":8
            });
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

