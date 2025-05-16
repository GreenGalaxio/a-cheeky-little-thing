// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_dthrow_65

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

    public dynamic class ness_dthrow_65 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var itemBox:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function ness_dthrow_65()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 5, this.frame6, 10, this.frame11, 15, this.frame16, 20, this.frame21, 21, this.frame22, 26, this.frame27);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.xframe = null;
                this.self.updateAttackBoxStats(1, {
                    "direction":0,
                    "power":100,
                    "kbConstant":1,
                    "hitStun":4
                });
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(5);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame21():*
        {
            SSF2API.shakeCamera(9);
        }

        internal function frame22():*
        {
            this.xframe = "attack";
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {
                "direction":50,
                "power":50,
                "kbConstant":90,
                "hitLag":-1,
                "hasEffect":true,
                "meteorBounce":true
            });
            this.self.refreshAttackID();
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package ness_fla

