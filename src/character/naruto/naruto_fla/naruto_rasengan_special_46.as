// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_rasengan_special_46

package naruto_fla
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

    public dynamic class naruto_rasengan_special_46 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var xframe:String;
        public var sfxStop:Number;
        public var sfxStop2:Number;

        public function naruto_rasengan_special_46()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 6, this.frame7, 22, this.frame23, 23, this.frame24, 29, this.frame30, 47, this.frame48, 48, this.frame49, 54, this.frame55, 90, this.frame91);
        }

        public function fireProjectile(_arg_1:*=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.fireProjectile);
            this.self.fireProjectile("kyuubi_yooko_rasengan");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.xframe = "charging";
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.fireProjectile);
            };
        }

        internal function frame2():*
        {
            this.sfxStop = this.self.playVoiceSound(1);
            this.sfxStop2 = this.self.playAttackSound(1);
        }

        internal function frame7():*
        {
            SSF2API.playSound("naruto_bunshin");
        }

        internal function frame23():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame24():*
        {
            this.xframe = "attack";
            SSF2API.stopSound(this.sfxStop);
            SSF2API.stopSound(this.sfxStop2);
            this.self.updateAttackStats({
                "cancelSoundOnEnd":false,
                "cancelVoiceOnEnd":false
            });
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame30():*
        {
        }

        internal function frame48():*
        {
            this.self.endAttack();
        }

        internal function frame49():*
        {
            this.xframe = "attack2";
            this.self.updateAttackStats({
                "air_ease":2,
                "cancelSoundOnEnd":false,
                "cancelVoiceOnEnd":false
            });
            SSF2API.stopSound(this.sfxStop);
            SSF2API.stopSound(this.sfxStop2);
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.fireProjectile);
        }

        internal function frame55():*
        {
            this.self.fireProjectile("kyuubi_kyuubi_rasengan");
        }

        internal function frame91():*
        {
            this.self.endAttack();
        }


    }
}//package naruto_fla

