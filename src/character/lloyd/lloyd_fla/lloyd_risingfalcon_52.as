// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_risingfalcon_52

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class lloyd_risingfalcon_52 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var disable:Boolean;

        public function lloyd_risingfalcon_52()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 9, this.frame10, 14, this.frame15, 26, this.frame27, 33, this.frame34, 39, this.frame40, 40, this.frame41, 46, this.frame47, 56, this.frame57);
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
                this.self.setYSpeed(-11);
            };
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.disable = this.self.getGlobalVariable("upSpecUsed");
                if (this.disable)
                {
                    SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                };
            };
        }

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame10():*
        {
            this.self.attachEffectOverlay("dairsparkle");
            this.self.playAttackSound(2);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
        }

        internal function frame15():*
        {
            this.self.playAttackSound(1);
            this.self.updateAttackStats({"air_ease":-1});
            this.self.setXSpeed(13, false);
            this.self.setYSpeed(17);
        }

        internal function frame27():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":1,
                "direction":45,
                "kbConstant":40,
                "power":10
            });
            this.self.updateAttackBoxStats(2, {
                "damage":1,
                "direction":45,
                "kbConstant":40,
                "power":10
            });
            this.self.updateAttackStats({
                "xSpeedDecayAir":-0.8,
                "air_ease":6
            });
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toIdle);
        }

        internal function frame34():*
        {
        }

        internal function frame40():*
        {
            this.self.endAttack();
        }

        internal function frame41():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "damage":1,
                "direction":45,
                "kbConstant":40,
                "power":10
            });
            this.self.updateAttackBoxStats(2, {
                "damage":1,
                "direction":45,
                "kbConstant":40,
                "power":10
            });
            this.self.updateAttackStats({
                "cancelWhenAirborne":true,
                "refreshRate":200
            });
        }

        internal function frame47():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackBoxStats(1, {
                "effect_id":"sliceBoth",
                "kbConstant":100,
                "direction":150,
                "power":30,
                "hitLag":-1,
                "damage":5
            });
            this.self.updateAttackBoxStats(2, {
                "effect_id":"sliceBoth",
                "kbConstant":100,
                "direction":150,
                "power":30,
                "hitLag":-1,
                "damage":5
            });
        }

        internal function frame57():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

