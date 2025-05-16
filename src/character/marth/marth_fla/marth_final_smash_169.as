// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_final_smash_169

package marth_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class marth_final_smash_169 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox7:MovieClip;
        public var self:*;
        public var slash:Boolean;
        public var landingBool:Boolean;
        public var controls:Object;

        public function marth_final_smash_169()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 26, this.frame27, 53, this.frame54, 54, this.frame55, 55, this.frame56, 56, this.frame57, 59, this.frame60, 65, this.frame66);
        }

        public function jumpToSlash(_arg_1:Event=null):*
        {
            this.self.playAttackSound(2);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.jumpToSlash);
            gotoAndPlay("slash");
        }

        public function dash():void
        {
            this.self.setXSpeed(50, false);
        }

        public function pressedSpecial():void
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.jumpToSlash();
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.slash = false;
            this.landingBool = false;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.jumpToSlash);
                this.controls = this.self.getControls();
                this.self.camFocus(24);
                this.self.playAttackSound(1);
            };
        }

        internal function frame7():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame27():*
        {
            SSF2API.createTimer(this.self, 1, 27, this.dash);
        }

        internal function frame54():*
        {
            SSF2API.destroyTimer(this.self, this.dash);
            SSF2API.destroyTimer(this.self, this.pressedSpecial);
            this.self.setXSpeed(0);
            this.self.endAttack();
        }

        internal function frame55():*
        {
            this.self.setXSpeed(0);
            SSF2API.destroyTimer(this.self, this.dash);
            SSF2API.destroyTimer(this.self, this.pressedSpecial);
        }

        internal function frame56():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":60,
                "priority":7,
                "hitStun":20,
                "selfHitStun":8,
                "effect_id":"effect_swordSlash",
                "direction":40,
                "power":100,
                "kbConstant":100,
                "effectSound":"sw_brawl_hit_M"
            });
        }

        internal function frame57():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame60():*
        {
            this.self.playAttackSound(4);
        }

        internal function frame66():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

