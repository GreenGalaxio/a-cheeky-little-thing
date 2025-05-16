// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//samus_fla.samus_screw_attack_45

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

    public dynamic class samus_screw_attack_45 extends MovieClip 
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

        public function samus_screw_attack_45()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 6, this.frame7, 7, this.frame8, 11, this.frame12, 12, this.frame13, 15, this.frame16, 19, this.frame20, 22, this.frame23, 24, this.frame25);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.self.setIntangibility(true);
            };
        }

        internal function frame3():*
        {
            this.self.setXSpeed((this.self.getXSpeed() / 2));
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.self.setIntangibility(false);
            this.self.setYSpeed(-20);
            this.self.unnattachFromGround();
            this.self.playAttackSound(2);
        }

        internal function frame7():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame8():*
        {
            this.self.setYSpeed(0);
            this.self.updateAttackBoxStats(1, {
                "power":0,
                "kbConstant":50,
                "damage":2,
                "hitStun":2,
                "selfHitStun":1
            });
            this.self.updateAttackStats({"refreshRate":1});
            this.self.playAttackSound(3);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame13():*
        {
            this.self.updateAttackBoxStats(1, {
                "power":90,
                "kbConstant":107
            });
            this.self.refreshAttackID();
            this.self.updateAttackStats({"air_ease":2.5});
        }

        internal function frame16():*
        {
            this.self.playAttackSound(5);
        }

        internal function frame20():*
        {
            this.self.playAttackSound(6);
        }

        internal function frame23():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package samus_fla

