// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.Peach_Combo_23

package peach_fla
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

    public dynamic class Peach_Combo_23 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var handled:Boolean;
        public var newStats:Object;

        public function Peach_Combo_23()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 19, this.frame20);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.continuePlaying = false;
                this.handled = true;
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            this.continuePlaying = false;
            this.handled = false;
        }

        internal function frame8():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame9():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            };
        }

        internal function frame10():*
        {
            if (this.continuePlaying == true)
            {
                gotoAndPlay("combo2");
            }
            else
            {
                this.self.endAttack();
            };
        }

        internal function frame11():*
        {
            this.newStats = {
                "kbConstant":80,
                "weightKB":0,
                "power":60,
                "damage":5,
                "direction":38
            };
            this.self.updateAttackBoxStats(1, this.newStats);
            this.self.refreshAttackID();
            this.self.playAttackSound(1);
        }

        internal function frame20():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

