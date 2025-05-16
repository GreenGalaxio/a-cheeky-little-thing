// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_screw_attack_air_47

package samus_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
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

    public dynamic class samus_screw_attack_air_47 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;

        public function samus_screw_attack_air_47()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 5, this.frame6, 6, this.frame7, 10, this.frame11, 14, this.frame15, 15, this.frame16, 18, this.frame19, 21, this.frame22);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.self.playAttackSound(1);
                this.self.setYSpeed(-18.5);
                this.self.setIntangibility(true);
            };
        }

        internal function frame3():*
        {
            this.self.setIntangibility(false);
        }

        internal function frame4():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame11():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(5);
        }

        internal function frame16():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":50,
                "kbConstant":107
            });
            this.self.updateAttackStats({"refreshRate":1});
            this.self.refreshAttackID();
        }

        internal function frame19():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            this.self.playAttackSound(6);
        }

        internal function frame22():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

