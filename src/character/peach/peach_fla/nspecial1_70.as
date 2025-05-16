// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//peach_fla.nspecial1_70

package peach_fla
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

    public dynamic class nspecial1_70 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var counterBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var power:*;
        public var kbConstant:*;
        public var damage:*;
        public var used:Boolean;
        public var grounded:Boolean;

        public function nspecial1_70()
        {
            addFrameScript(0, this.frame1, 5, this.frame6, 29, this.frame30, 30, this.frame31, 35, this.frame36, 54, this.frame55);
        }

        public function counter(_arg_1:*):*
        {
            this.self.setInvincibility(true);
            SSF2API.removeEventListener(this.self, SSF2Event.CHAR_COUNTER, this.counter);
            this.power = _arg_1.data.attackBoxData.power;
            if (this.power < 10)
            {
                this.power = 10;
            };
            if (this.power > 50)
            {
                this.power = 50;
            };
            this.kbConstant = (_arg_1.data.attackBoxData.kbConstant * 1.2);
            if (this.kbConstant < 60)
            {
                this.kbConstant = 60;
            };
            if (this.kbConstant > 80)
            {
                this.kbConstant = 80;
            };
            this.damage = (_arg_1.data.attackBoxData.damage / 4);
            if (this.damage < 2)
            {
                this.damage = 2;
            };
            if (this.damage > 4)
            {
                this.damage = 4;
            };
            if (_arg_1.data.receiver.getX() < this.self.getX())
            {
                this.self.faceLeft();
            }
            else
            {
                this.self.faceRight();
            };
            _arg_1.data.receiver.forceHitStun(10, 0);
            this.self.forceHitStun(5, 0);
            this.self.updateAttackBoxStats(1, {
                "damage":this.damage,
                "kbConstant":this.kbConstant,
                "power":this.power
            });
            gotoAndPlay("counter");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.power = 50;
            this.kbConstant = 30;
            this.damage = 4;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.used = this.self.getGlobalVariable("used");
                this.self.updateAttackStats({"forceGrabbable":true});
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_COUNTER, this.counter, null);
            };
        }

        internal function frame6():*
        {
            this.grounded = this.self.isOnGround();
            this.self.playAttackSound(1);
            this.self.setGlobalVariable("used", true);
            if (((!(this.used)) && (!(this.grounded))))
            {
                this.self.setYSpeed(-11);
            };
        }

        internal function frame30():*
        {
            this.self.endAttack();
        }

        internal function frame31():*
        {
            this.self.playAttackSound(2);
        }

        internal function frame36():*
        {
            this.self.setInvincibility(false);
        }

        internal function frame55():*
        {
            this.self.endAttack();
        }


    }
}//package peach_fla

