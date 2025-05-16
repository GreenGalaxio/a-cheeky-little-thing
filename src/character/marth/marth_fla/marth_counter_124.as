// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//marth_fla.marth_counter_124

package marth_fla
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

    public dynamic class marth_counter_124 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox7:MovieClip;
        public var counterBox:MovieClip;
        public var self:*;
        public var damage:int;
        public var power:int;
        public var kbConstant:int;

        public function marth_counter_124()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 22, this.frame23, 23, this.frame24, 25, this.frame26, 29, this.frame30);
        }

        public function counter(_arg_1:*):*
        {
            SSF2API.print(_arg_1.toString());
            this.self.setInvincibility(true);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_COUNTER, this.counter);
            this.power = (_arg_1.data.attackBoxData.power * 1.2);
            if (this.power < 60)
            {
                this.power = 60;
            };
            if (this.power > 100)
            {
                this.power = 100;
            };
            this.kbConstant = (_arg_1.data.attackBoxData.kbConstant * 1.2);
            if (this.kbConstant < 80)
            {
                this.kbConstant = 80;
            };
            if (this.kbConstant > 100)
            {
                this.kbConstant = 100;
            };
            this.damage = (_arg_1.data.attackBoxData.damage * 1.2);
            if (this.damage < 7)
            {
                this.damage = 7;
            };
            if (this.damage > 20)
            {
                this.damage = 20;
            };
            if (_arg_1.data.receiver.getX() < this.self.getX())
            {
                this.self.faceLeft();
            }
            else
            {
                this.self.faceRight();
            };
            _arg_1.data.receiver.forceHitStun(15, 0);
            this.self.forceHitStun(10, 0);
            gotoAndPlay("counter");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.damage = 1;
            this.power = 40;
            this.kbConstant = 80;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.self.updateAttackStats({"forceGrabbable":true});
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_COUNTER, this.counter, null);
                SSF2API.createTimer(this.self, 1, 4, function ():*
                {
                    self.setXSpeed(0);
                    self.setYSpeed(0);
                });
            };
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame23():*
        {
            this.self.endAttack();
        }

        internal function frame24():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":this.damage,
                "power":this.power,
                "kbConstant":this.kbConstant
            });
        }

        internal function frame26():*
        {
            if (this.damage < 10)
            {
                this.self.playVoiceSound(1);
            }
            else
            {
                if (((this.damage >= 10) && (this.damage < 18)))
                {
                    this.self.playVoiceSound(2);
                }
                else
                {
                    this.self.playVoiceSound(3);
                };
            };
            this.self.setInvincibility(false);
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }


    }
}//package marth_fla

