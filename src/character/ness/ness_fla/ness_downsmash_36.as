// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_downsmash_36

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.system.*;
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
    import flash.text.*;
    import flash.text.ime.*;
    import flash.text.engine.*;
    import flash.ui.*;
    import flash.utils.*;
    import flash.xml.*;

    public dynamic class ness_downsmash_36 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ness_downsmash_36()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 11, this.frame12, 12, this.frame13, 13, this.frame14, 30, this.frame31);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame7():*
        {
            this.xframe = "charging";
        }

        internal function frame12():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame13():*
        {
            this.xframe = "attack";
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":9,
                "power":60,
                "kbConstant":58,
                "direction":31
            });
            this.self.updateAttackStats({"refreshRate":50});
        }

        internal function frame14():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            this.self.updateAttackStats({"refreshRate":50});
        }

        internal function frame31():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

