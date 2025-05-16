// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_nspec_32

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

    public dynamic class metaknight_nspec_32 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var attackBox3:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var self:*;
        public var controls:Object;
        public var missed:Boolean;
        public var hit:Boolean;
        public var soundGate1:Boolean;
        public var soundGate2:Boolean;
        public var timesLooped:Number;

        public function metaknight_nspec_32()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 7, this.frame8, 8, this.frame9, 9, this.frame10, 10, this.frame11, 11, this.frame12, 12, this.frame13, 13, this.frame14, 14, this.frame15, 15, this.frame16, 16, this.frame17, 20, this.frame21, 26, this.frame27);
        }

        public function tornadoCheck():void
        {
            if (this.controls.BUTTON1)
            {
                this.self.setYSpeed(-4);
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.controls = this.self.getControls();
                this.missed = false;
                this.hit = false;
                this.soundGate1 = false;
                this.soundGate2 = false;
                this.timesLooped = 0;
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame8():*
        {
            if (this.soundGate2 == true)
            {
                this.self.playAttackSound(2);
            };
            this.controls = this.self.getControls();
            this.missed = false;
            this.hit = false;
            this.tornadoCheck();
        }

        internal function frame9():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.missed = true;
            };
            this.tornadoCheck();
        }

        internal function frame10():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.missed = true;
            };
            this.tornadoCheck();
        }

        internal function frame11():*
        {
            this.controls = this.self.getControls();
            if (!this.controls.BUTTON1)
            {
                this.missed = true;
            };
            this.tornadoCheck();
        }

        internal function frame12():*
        {
            if (this.soundGate2 == true)
            {
                this.self.playAttackSound(2);
            };
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.hit = true;
            };
            this.tornadoCheck();
        }

        internal function frame13():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.hit = true;
            };
            this.tornadoCheck();
        }

        internal function frame14():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.hit = true;
            };
            this.tornadoCheck();
        }

        internal function frame15():*
        {
            this.controls = this.self.getControls();
            if (this.controls.BUTTON1)
            {
                this.hit = true;
            };
            if (this.soundGate1 == true)
            {
                this.soundGate2 = true;
            };
            this.tornadoCheck();
        }

        internal function frame16():*
        {
            if (this.timesLooped == 4)
            {
                gotoAndPlay("end");
            }
            else
            {
                if (this.timesLooped == 0)
                {
                    this.soundGate1 = true;
                    this.timesLooped = (this.timesLooped + 1);
                    gotoAndPlay("redo");
                }
                else
                {
                    if (((this.hit) && (this.missed)))
                    {
                        this.soundGate1 = true;
                        this.timesLooped = (this.timesLooped + 1);
                        gotoAndPlay("redo");
                    };
                };
            };
        }

        internal function frame17():*
        {
            this.self.refreshAttackID();
            this.self.updateAttackStats({"allowControlGround":false});
            this.self.updateAttackBoxStats(1, {
                "damage":3,
                "power":45,
                "kbConstant":170,
                "direction":90,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(2, {
                "damage":3,
                "power":45,
                "kbConstant":170,
                "direction":90,
                "hitLag":-1
            });
            this.self.updateAttackBoxStats(3, {
                "damage":3,
                "power":45,
                "kbConstant":170,
                "direction":90,
                "hitLag":-1
            });
        }

        internal function frame21():*
        {
            if (!this.self.isOnGround())
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
            };
        }

        internal function frame27():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

