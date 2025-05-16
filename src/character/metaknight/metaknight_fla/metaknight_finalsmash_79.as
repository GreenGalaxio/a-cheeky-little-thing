// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_finalsmash_79

package metaknight_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.geom.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;
    import flash.media.*;
    import flash.filters.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
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
    import flash.xml.*;

    public dynamic class metaknight_finalsmash_79 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var grabBox:MovieClip;
        public var self:*;
        public var continuePlaying:Boolean;
        public var playsound:Number;
        public var audio:Number;

        public function metaknight_finalsmash_79()
        {
            addFrameScript(0, this.frame1, 7, this.frame8, 27, this.frame28, 44, this.frame45, 45, this.frame46, 74, this.frame75, 113, this.frame114, 138, this.frame139);
        }

        public function keepGoing(_arg_1:*=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.keepGoing);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.keepGoing);
            this.continuePlaying = true;
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.continuePlaying = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.playsound = SSF2API.random();
                this.audio = this.self.getGlobalVariable("audio");
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.keepGoing);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_CONNECT_SHIELD, this.keepGoing);
            };
        }

        internal function frame8():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame28():*
        {
            if (this.continuePlaying)
            {
                gotoAndPlay("hit");
            };
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }

        internal function frame46():*
        {
            this.self.attachEffectOverlay("metaknight_fs_dark");
        }

        internal function frame75():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "power":50,
                "kbConstant":90,
                "hitStun":4
            });
            this.self.playVoiceSound(2);
        }

        internal function frame114():*
        {
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {
                "hasEffect":true,
                "sdiDistance":1,
                "damage":40
            });
        }

        internal function frame139():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

