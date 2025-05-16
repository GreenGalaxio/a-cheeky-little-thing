// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//link_fla.link_new_uspec_air_45

package link_fla
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

    public dynamic class link_new_uspec_air_45 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;

        public function link_new_uspec_air_45()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 5, this.frame6, 7, this.frame8, 9, this.frame10, 11, this.frame12, 13, this.frame14, 15, this.frame16, 17, this.frame18, 19, this.frame20, 21, this.frame22, 23, this.frame24, 28, this.frame29, 36, this.frame37);
        }

        public function uSpecConstant():void
        {
            this.self.setYSpeed(-9);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.setGlobalVariable("nStoredLabel", null);
                this.self.setGlobalVariable("sStoredLabel", null);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
        }

        internal function frame2():*
        {
            this.self.playVoiceSound(1);
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.self.playAttackSound(2);
            this.self.updateAttackStats({"air_ease":0});
            SSF2API.createTimer(this.self, 1, 21, this.uSpecConstant);
        }

        internal function frame6():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame8():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame10():*
        {
            this.self.playAttackSound(5);
        }

        internal function frame12():*
        {
            this.self.playAttackSound(6);
        }

        internal function frame14():*
        {
            this.self.playAttackSound(7);
        }

        internal function frame16():*
        {
            this.self.playAttackSound(8);
            this.self.updateAttackBoxStats(1, {"power":40});
            this.self.updateAttackBoxStats(2, {"power":40});
        }

        internal function frame18():*
        {
            this.self.playAttackSound(9);
        }

        internal function frame20():*
        {
            this.self.playAttackSound(10);
        }

        internal function frame22():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":6,
                "power":80,
                "direction":45,
                "weightKB":0,
                "kbConstant":110
            });
            this.self.updateAttackBoxStats(2, {
                "damage":6,
                "power":80,
                "weightKB":0,
                "direction":55,
                "kbConstant":110
            });
            this.self.updateAttackStats({"refreshRate":100});
        }

        internal function frame24():*
        {
            this.self.playAttackSound(12);
        }

        internal function frame29():*
        {
            this.self.updateAttackStats({"air_ease":-1});
            SSF2API.destroyTimer(this.self, this.uSpecConstant);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame37():*
        {
            this.self.endAttack();
        }


    }
}//package link_fla

