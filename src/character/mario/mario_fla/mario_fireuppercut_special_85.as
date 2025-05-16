// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mario_fla.mario_fireuppercut_special_85

package mario_fla
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

    public dynamic class mario_fireuppercut_special_85 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hand:MovieClip;
        public var self:*;

        public function mario_fireuppercut_special_85()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 35, this.frame36, 43, this.frame44, 60, this.frame61, 69, this.frame70, 94, this.frame95, 95, this.frame96, 110, this.frame111);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame2():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame36():*
        {
            this.self.modifyHitStun(14);
            this.self.refreshAttackID();
            this.self.modifyRefreshRate(50);
        }

        internal function frame44():*
        {
            this.self.modifyAirEase(0);
            this.self.modifyAttackPower(5);
            this.self.modifyAttackDirection(-9);
            this.self.modifyHitStun(6);
            this.self.setYSpeed(0);
            this.self.modifyRefreshRate(1);
            this.self.modifyAllowControl(true);
        }

        internal function frame61():*
        {
            this.self.modifyHitStun(16);
            this.self.modifyRefreshRate(90);
            this.self.refreshAttackID();
        }

        internal function frame70():*
        {
            this.self.modifyAttackDirection(270);
            this.self.modifyAirEase(-1);
            this.self.modifyAttackPower(50);
            this.self.modifyAttackDamage(1);
            this.self.modifyRefreshRate(1);
            this.self.refreshAttackID();
            this.self.modifyYConstant(12);
            this.self.modifyHitStun(1);
            this.self.modifyRefreshRate(1);
            this.self.modifyStickyGround(true);
        }

        internal function frame95():*
        {
            gotoAndPlay("falling");
        }

        internal function frame96():*
        {
            this.self.modifyAttackDirection(-3);
            this.self.modifyAttackPower(50);
            this.self.modifyKBConstant(70);
            this.self.modifyRefreshRate(50);
            this.self.refreshAttackID();
            this.self.modifyAllowControl(false);
        }

        internal function frame111():*
        {
            this.self.endAttack();
        }


    }
}//package mario_fla

