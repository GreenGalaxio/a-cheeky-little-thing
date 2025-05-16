// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_fla.megaman_blackholebomb_126

package megaman_fla
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

    public dynamic class megaman_blackholebomb_126 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var self:*;
        public var timer:*;
        public var maxTime:*;
        public var foe:*;
        public var held:*;
        public var hitArmor:*;
        public var character:*;
        public var replay:*;
        public var lastFrameFoeControls:*;
        public var foeControls:*;
        public var oldTimer:*;
        public var attackBoxData:*;

        public function megaman_blackholebomb_126()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 12, this.frame13, 24, this.frame25, 35, this.frame36, 36, this.frame37, 38, this.frame39, 47, this.frame48, 48, this.frame49, 57, this.frame58);
        }

        public function grabFoe(_arg_1:*):void
        {
            if (((_arg_1.data.caller == this.self) && (!(_arg_1.data.receiver == this.self))))
            {
                this.foe = _arg_1.data.receiver;
                if (SSF2API.getCharacter(this.foe) != null)
                {
                    this.held = true;
                }
                else
                {
                    this.foe = null;
                };
            };
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.grabFoe);
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.grabFoe);
        }

        public function foeMashing():void
        {
            this.oldTimer = this.timer;
            this.foeControls = this.foe.getControls();
            if (((this.foeControls.BUTTON1) && (!(this.lastFrameFoeControls.BUTTON1))))
            {
                (this.timer + 2);
            };
            if (((this.foeControls.BUTTON2) && (!(this.lastFrameFoeControls.BUTTON2))))
            {
                (this.timer + 2);
            };
            if (((this.foeControls.UP) && (!(this.lastFrameFoeControls.UP))))
            {
                (this.timer + 2);
            };
            if (((this.foeControls.DOWN) && (!(this.lastFrameFoeControls.DOWN))))
            {
                (this.timer + 2);
            };
            if (((this.foeControls.LEFT) && (!(this.lastFrameFoeControls.LEFT))))
            {
                (this.timer + 2);
            };
            if (((this.foeControls.RIGHT) && (!(this.lastFrameFoeControls.RIGHT))))
            {
                (this.timer + 2);
            };
            if (this.oldTimer != this.timer)
            {
                SSF2API.print("Success!");
            };
            this.lastFrameFoeControls = this.foeControls;
        }

        public function freeFoe():void
        {
            this.held = false;
            this.self.destroyTimer(this.holder);
            SSF2API.removeEventListener(this.foe, SSF2Event.CHAR_HURT, this.heavyArmor);
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "hitStun":4,
                "hasEffect":true,
                "power":115,
                "stackKnockback":false,
                "direction":60,
                "hitLag":-1
            });
            this.self.refreshAttackID();
        }

        public function holder():void
        {
            if (this.held)
            {
                this.timer++;
                if (this.timer > this.maxTime)
                {
                    this.freeFoe();
                };
                this.foe.setX(this.self.getX());
                this.foe.setY(this.self.getY());
                if (this.foe.getMC().currentFrameLabel != "hurt")
                {
                    this.self.refreshAttackID();
                };
            };
        }

        public function heavyArmor(_arg_1:*):void
        {
            if (_arg_1.data.opponent != this.self)
            {
                SSF2API.print(_arg_1.data.attackBoxData.damage);
            };
            if (((this.held) && (_arg_1.data.attackBoxData.damage >= 5)))
            {
                this.hitArmor = true;
                SSF2API.print("Damage >= 5, releasing.");
                this.freeFoe();
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.timer = 0;
            this.maxTime = 180;
            this.foe = null;
            this.held = false;
            this.hitArmor = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT_SHIELD, this.grabFoe);
                SSF2API.addEventListener(this.self, SSF2Event.ATTACK_HIT, this.grabFoe);
            };
        }

        internal function frame2():*
        {
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.playSound("bhb1");
            };
        }

        internal function frame13():*
        {
            SSF2API.playSound("bhb1");
        }

        internal function frame25():*
        {
            SSF2API.playSound("bhb1");
        }

        internal function frame36():*
        {
            this.gotoAndPlay("again");
        }

        internal function frame37():*
        {
            SSF2API.playSound("bhb2");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.endControl();
            this.replay = false;
            this.lastFrameFoeControls = null;
            this.foeControls = null;
            this.oldTimer = this.timer;
            this.attackBoxData = null;
            SSF2API.addEventListener(this.foe, SSF2Event.CHAR_HURT, this.heavyArmor, {"persistent":true});
            SSF2API.createTimer(this.self, 0, -1, this.holder);
        }

        internal function frame39():*
        {
            if (((!(this.held)) && (!(this.replay))))
            {
                SSF2API.removeEventListener(this.foe, SSF2Event.CHAR_HURT, this.heavyArmor);
                gotoAndPlay("fail");
            };
        }

        internal function frame48():*
        {
            this.replay = true;
            if (this.held)
            {
                gotoAndPlay("continue");
            }
            else
            {
                this.self.destroy();
            };
        }

        internal function frame49():*
        {
            SSF2API.playSound("bhb2");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.endControl();
            SSF2API.removeEventListener(this.self, SSF2Event.ATTACK_HIT, this.grabFoe);
        }

        internal function frame58():*
        {
            this.self.destroy();
        }


    }
}//package megaman_fla

