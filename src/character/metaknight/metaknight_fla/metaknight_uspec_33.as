// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//metaknight_fla.metaknight_uspec_33

package metaknight_fla
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

    public dynamic class metaknight_uspec_33 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var isRecovering:*;
        public var rand:*;
        public var self:*;
        public var player:*;
        public var controls:Object;
        public var attacked:*;

        public function metaknight_uspec_33()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 3, this.frame4, 5, this.frame6, 6, this.frame7, 8, this.frame9, 12, this.frame13, 15, this.frame16, 17, this.frame18, 20, this.frame21, 21, this.frame22, 22, this.frame23, 24, this.frame25, 26, this.frame27, 27, this.frame28, 28, this.frame29, 30, this.frame31, 32, this.frame33, 33, this.frame34, 41, this.frame42, 42, this.frame43, 44, this.frame45, 54, this.frame55);
        }

        public function cpuSlash():void
        {
            if (this.isRecovering == true)
            {
                this.rand = (SSF2API.random() * 100);
                if (((((!(this.player.inUpperLeftWarningBounds())) && (!(this.player.inLowerLeftWarningBounds()))) && (!(this.player.inUpperRightWarningBounds()))) && (!(this.player.inLowerRightWarningBounds()))))
                {
                    if (this.rand > 50)
                    {
                        this.player.importCPUControls([32, 1]);
                    }
                    else
                    {
                        this.player.importCPUControls([2, 1]);
                    };
                };
            }
            else
            {
                if (this.isRecovering == false)
                {
                    this.rand = (SSF2API.random() * 100);
                    if (((((this.player.inUpperLeftWarningBounds()) || (this.player.inLowerLeftWarningBounds())) || (this.player.inUpperRightWarningBounds())) || (this.player.inLowerRightWarningBounds())))
                    {
                        if (this.rand > 50)
                        {
                            this.player.importCPUControls([32, 1]);
                        }
                        else
                        {
                            this.player.importCPUControls([2, 3]);
                        };
                    };
                };
            };
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.isRecovering = false;
            this.rand = 0;
            this.self = SSF2API.getCharacter(this);
            if (((this.self) && (SSF2API.isReady())))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
        }

        internal function frame2():*
        {
            this.player = this.self;
            if (((((this.player.inUpperLeftWarningBounds()) || (this.player.inLowerLeftWarningBounds())) || (this.player.inUpperRightWarningBounds())) || (this.player.inLowerRightWarningBounds())))
            {
                this.isRecovering = true;
            };
            this.controls = this.self.getControls();
        }

        internal function frame4():*
        {
            this.self.playAttackSound(2);
            this.self.playVoiceSound(1);
        }

        internal function frame6():*
        {
            this.self.setYSpeed(-25);
        }

        internal function frame7():*
        {
            this.self.updateAttackBoxStats(1, {
                "direction":70,
                "kbConstant":80
            });
            this.self.updateAttackBoxStats(2, {
                "direction":70,
                "kbConstant":80
            });
            this.self.updateAttackBoxStats(3, {
                "direction":70,
                "kbConstant":80
            });
        }

        internal function frame9():*
        {
            this.self.setYSpeed(-5);
            this.self.setXSpeed(-14, false);
        }

        internal function frame13():*
        {
            this.self.setYSpeed(6);
            this.self.setXSpeed(-6, false);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.playAttackSound(1);
        }

        internal function frame16():*
        {
            this.self.setYSpeed(4);
            this.self.setXSpeed(0, false);
        }

        internal function frame18():*
        {
            this.self.setYSpeed(0);
            this.self.setXSpeed(14, false);
        }

        internal function frame21():*
        {
            this.cpuSlash();
            this.rand = (SSF2API.random() * 100);
            if (((this.rand < 11) && (!(this.isRecovering))))
            {
                this.player.importCPUControls([2, 1]);
            }
            else
            {
                if (((this.rand < 21) && (!(this.isRecovering))))
                {
                    this.player.importCPUControls([32, 1]);
                };
            };
            this.self.setXSpeed(10.2, false);
            this.controls = this.self.getControls();
            if (this.controls.DOWN)
            {
                gotoAndPlay("down");
            };
            if (this.controls.SHIELD)
            {
                this.self.endAttack();
            };
            if (((this.controls.BUTTON2) || (this.controls.BUTTON1)))
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame22():*
        {
            gotoAndPlay("loop");
        }

        internal function frame23():*
        {
            this.cpuSlash();
            this.self.updateAttackStats({"air_ease":7});
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack();
            };
            if (((this.controls.BUTTON2) || (this.controls.BUTTON1)))
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame25():*
        {
            this.cpuSlash();
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack();
            };
            if (((this.controls.BUTTON2) || (this.controls.BUTTON1)))
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame27():*
        {
            this.cpuSlash();
            this.self.setXSpeed(4, false);
            this.controls = this.self.getControls();
            if (!this.controls.DOWN)
            {
                gotoAndPlay("up");
            };
            if (this.controls.SHIELD)
            {
                this.self.endAttack();
            };
            if (((this.controls.BUTTON2) || (this.controls.BUTTON1)))
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame28():*
        {
            gotoAndPlay("downLoop");
        }

        internal function frame29():*
        {
            this.cpuSlash();
            this.self.updateAttackStats({"air_ease":2});
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack();
            };
            if (((this.controls.BUTTON2) || (this.controls.BUTTON1)))
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame31():*
        {
            this.cpuSlash();
            this.controls = this.self.getControls();
            if (this.controls.SHIELD)
            {
                this.self.endAttack();
            };
            if (((this.controls.BUTTON2) || (this.controls.BUTTON1)))
            {
                gotoAndPlay("attack");
            };
        }

        internal function frame33():*
        {
            gotoAndPlay("loop");
        }

        internal function frame34():*
        {
            if (!this.attacked)
            {
                this.self.setXSpeed(15, false);
            };
            this.self.updateAttackStats({
                "cancelWhenAirborne":true,
                "xSpeedDecay":-1.2
            });
        }

        internal function frame42():*
        {
            this.self.toIdle();
        }

        internal function frame43():*
        {
            this.self.updateAttackBoxStats(1, {"direction":90});
            this.self.updateAttackBoxStats(2, {"direction":90});
            this.self.refreshAttackID();
            this.self.updateAttackStats({
                "air_ease":-1,
                "allowControl":true
            });
            this.self.playAttackSound(3);
            this.attacked = true;
        }

        internal function frame45():*
        {
            this.self.playAttackSound(3);
        }

        internal function frame55():*
        {
            this.self.endAttack();
        }


    }
}//package metaknight_fla

