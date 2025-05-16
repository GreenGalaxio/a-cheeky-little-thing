// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ichigo_fla.ichigo_downB_air_163

package ichigo_fla
{
    import flash.display.MovieClip;
    import flash.geom.ColorTransform;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;
    import flash.geom.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class ichigo_downB_air_163 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var ichigodspec:MovieClip;
        public var ichigodspec2:MovieClip;
        public var ichigodspec3:MovieClip;
        public var self:*;
        public var waiting:*;
        public var Damage:Number;
        public var KBC:Number;
        public var tintRed:ColorTransform;

        public function ichigo_downB_air_163()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 10, this.frame11, 11, this.frame12, 15, this.frame16, 18, this.frame19, 19, this.frame20, 21, this.frame22, 24, this.frame25);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.waiting = false;
                this.Damage = 6;
                this.KBC = 12;
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
                this.self.playVoiceSound(1);
                this.tintRed = new ColorTransform();
            };
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.tintRed.redOffset = 0;
        }

        internal function frame12():*
        {
            this.waiting = true;
            this.Damage = (this.Damage + 2);
            this.KBC++;
            this.self.updateAttackBoxStats(1, {
                "damage":this.Damage,
                "kbConstant":this.KBC
            });
            this.tintRed.redOffset = (this.tintRed.redOffset + 25);
            this.ichigodspec.transform.colorTransform = this.tintRed;
            this.ichigodspec2.transform.colorTransform = this.tintRed;
            this.ichigodspec3.transform.colorTransform = this.tintRed;
        }

        internal function frame16():*
        {
            this.Damage++;
            this.self.updateAttackBoxStats(1, {"damage":this.Damage});
        }

        internal function frame19():*
        {
            gotoAndPlay("freeze");
        }

        internal function frame20():*
        {
            this.self.playVoiceSound(2);
            this.self.playAttackSound(2);
        }

        internal function frame22():*
        {
            this.self.updateAttackStats({"allowControl":false});
        }

        internal function frame25():*
        {
            this.self.endAttack();
        }


    }
}//package ichigo_fla

