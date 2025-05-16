// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_specialU_51

package fox_fla
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

    public dynamic class fox_specialU_51 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var speed:Number;
        public var afterDecay:Number;
        public var isOnGround:*;
        public var controls:Object;
        public var isFacingRight:Boolean;
        public var north:Number;
        public var east:Number;
        public var up:*;
        public var down:*;
        public var right:*;
        public var left:*;
        public var flip:*;

        public function fox_specialU_51()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 19, this.frame20, 20, this.frame21, 21, this.frame22, 26, this.frame27, 35, this.frame36, 43, this.frame44, 44, this.frame45, 45, this.frame46, 50, this.frame51, 59, this.frame60, 60, this.frame61, 65, this.frame66, 73, this.frame74, 74, this.frame75, 75, this.frame76, 86, this.frame87, 89, this.frame90, 90, this.frame91, 101, this.frame102, 104, this.frame105, 105, this.frame106, 110, this.frame111, 119, this.frame120, 120, this.frame121, 125, this.frame126, 133, this.frame134, 134, this.frame135, 135, this.frame136, 146, this.frame147, 149, this.frame150, 150, this.frame151, 155, this.frame156, 158, this.frame159, 159, this.frame160, 160, this.frame161, 165, this.frame166, 168, this.frame169, 169, this.frame170);
        }

        public function landing(_arg_1:*):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
            SSF2API.print("landing");
            if (this.flip)
            {
                this.self.flip();
            };
            this.self.toLand();
        }

        public function afterImage():void
        {
            this.self.attachEffect("firefoxTrail");
        }

        public function fire(_arg_1:*=null):void
        {
            if (this.up)
            {
                this.self.setYSpeed(-(this.speed));
            };
            if (this.down)
            {
                this.self.setYSpeed(this.speed);
            };
            if (this.left)
            {
                this.self.setXSpeed(-(this.speed));
            };
            if (this.right)
            {
                this.self.setXSpeed(this.speed);
            };
        }

        public function bounce(_arg_1:*=null):void
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            if (((this.currentLabel == "takeoffSE") || (this.currentLabel == "takeoffSW")))
            {
                this.gotoAndPlay("bounceEast");
            }
            else
            {
                if (this.currentLabel == "takeoffS")
                {
                    this.gotoAndPlay("bounceNorth");
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.updateAttackStats({"allowControl":false});
                this.self.playAttackSound(1);
                this.self.setYSpeed((this.self.getYSpeed() * 0.5));
                this.self.setXSpeed((this.self.getXSpeed() * 0.65));
                this.speed = 16.5;
                this.afterDecay = -0.5;
                this.isOnGround = this.self.isOnGround();
            };
        }

        internal function frame10():*
        {
        }

        internal function frame20():*
        {
            this.self.updateAttackBoxStats(1, {"kbConstant":60});
        }

        internal function frame21():*
        {
            this.controls = this.self.getControls();
            this.isFacingRight = this.self.isFacingRight();
            this.north = 0;
            this.east = 0;
            this.up = false;
            this.down = false;
            this.right = false;
            this.left = false;
            this.flip = false;
            this.self.updateAttackStats({"air_ease":-1});
            this.self.updateAttackBoxStats(1, {
                "power":60,
                "hitStun":2,
                "direction":90,
                "selfHitStun":1,
                "damage":14
            });
            this.self.refreshAttackID();
            this.self.unnattachFromGround();
            SSF2API.createTimer(this.self, 3, 15, this.afterImage);
            this.controls = this.self.getControls();
            if (this.controls.UP)
            {
                this.up = true;
            };
            if (this.controls.DOWN)
            {
                this.down = true;
            };
            if (this.controls.LEFT)
            {
                this.left = true;
            };
            if (this.controls.RIGHT)
            {
                this.right = true;
            };
            if (((this.isOnGround) && (this.down)))
            {
                this.down = false;
            };
            if (((((this.up) && (this.down)) || ((this.left) && (this.right))) || ((((!(this.up)) && (!(this.down))) && (!(this.left))) && (!(this.right)))))
            {
                this.up = true;
                this.left = false;
                this.right = false;
                this.down = false;
            };
            if (((((this.left) && (!(this.right))) && (!(this.up))) && (!(this.down))))
            {
                this.self.updateAttackStats({"air_ease":0});
                if (this.isFacingRight)
                {
                    this.flip = true;
                    gotoAndPlay("takeoffW");
                }
                else
                {
                    gotoAndPlay("takeoffE");
                };
            };
            if (((((this.right) && (!(this.left))) && (!(this.up))) && (!(this.down))))
            {
                this.self.updateAttackStats({"air_ease":0});
                if (this.isFacingRight)
                {
                    gotoAndPlay("takeoffE");
                }
                else
                {
                    this.flip = true;
                    gotoAndPlay("takeoffW");
                };
            };
            if (((((this.up) && (!(this.right))) && (!(this.left))) && (!(this.down))))
            {
                gotoAndPlay("takeoffN");
            };
            if (((((this.down) && (!(this.right))) && (!(this.left))) && (!(this.up))))
            {
                gotoAndPlay("takeoffS");
            };
            if (((((this.left) && (!(this.right))) && (this.up)) && (!(this.down))))
            {
                if (this.isFacingRight)
                {
                    this.flip = true;
                    gotoAndPlay("takeoffNW");
                }
                else
                {
                    gotoAndPlay("takeoffNE");
                };
            };
            if (((((this.right) && (!(this.left))) && (this.up)) && (!(this.down))))
            {
                if (this.isFacingRight)
                {
                    gotoAndPlay("takeoffNE");
                }
                else
                {
                    this.flip = true;
                    gotoAndPlay("takeoffNW");
                };
            };
            if (((((this.left) && (!(this.right))) && (!(this.up))) && (this.down)))
            {
                if (this.isFacingRight)
                {
                    this.flip = true;
                    gotoAndPlay("takeoffSW");
                }
                else
                {
                    gotoAndPlay("takeoffSE");
                };
            };
            if (((((this.right) && (!(this.left))) && (!(this.up))) && (this.down)))
            {
                if (this.isFacingRight)
                {
                    gotoAndPlay("takeoffSE");
                }
                else
                {
                    this.flip = true;
                    gotoAndPlay("takeoffSW");
                };
            };
            if ((((((this.up) && (this.right)) || ((this.up) && (this.left))) || ((this.down) && (this.right))) || ((this.down) && (this.left))))
            {
                this.speed = (this.speed / 1.2);
            };
            SSF2API.createTimer(this.self, 1, 14, this.fire);
        }

        internal function frame22():*
        {
            this.self.updateAttackBoxStats(1, {"damage":14});
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.resetMovement();
        }

        internal function frame27():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame36():*
        {
            SSF2API.destroyTimer(this.self, this.afterImage);
            SSF2API.destroyTimer(this.self, this.fire);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":6,
                "xSpeedDecayAir":0.25,
                "xSpeedCap":5
            });
            if (!this.self.isOnGround())
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
            }
            else
            {
                this.self.toLand();
            };
            if (this.flip)
            {
                this.flip = false;
                this.self.flip();
            };
        }

        internal function frame44():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1,
                "xSpeedDecayAir":0
            });
        }

        internal function frame45():*
        {
            this.gotoAndPlay("redo");
        }

        internal function frame46():*
        {
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"damage":14});
        }

        internal function frame51():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame60():*
        {
            gotoAndPlay("ending");
        }

        internal function frame61():*
        {
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"damage":14});
        }

        internal function frame66():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame74():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame75():*
        {
            gotoAndPlay("ending");
        }

        internal function frame76():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"damage":14});
        }

        internal function frame87():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame90():*
        {
            gotoAndPlay("ending");
        }

        internal function frame91():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"damage":14});
        }

        internal function frame102():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame105():*
        {
            gotoAndPlay("ending");
        }

        internal function frame106():*
        {
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"damage":14});
        }

        internal function frame111():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame120():*
        {
            gotoAndPlay("ending");
        }

        internal function frame121():*
        {
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"damage":14});
        }

        internal function frame126():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame134():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame135():*
        {
            gotoAndPlay("ending");
        }

        internal function frame136():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            this.self.updateAttackStats({"refreshRate":9999});
            this.self.playVoiceSound(1);
            this.self.playAttackSound(2);
            this.self.updateAttackBoxStats(1, {"damage":14});
        }

        internal function frame147():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.bounce);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame150():*
        {
            gotoAndPlay("ending");
        }

        internal function frame151():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1
            });
            this.self.unnattachFromGround();
            this.self.setYSpeed(-16);
            SSF2API.destroyTimer(this.self, this.afterImage);
            SSF2API.destroyTimer(this.self, this.fire);
            if (this.flip)
            {
                this.self.flip();
            };
            if (((this.flip) && (this.self.isFacingRight())))
            {
                this.self.setXSpeed(10);
            }
            else
            {
                if (((this.flip) && (!(this.self.isFacingRight()))))
                {
                    this.self.setXSpeed(-10);
                }
                else
                {
                    this.self.setXSpeed(10, false);
                };
            };
            this.flip = false;
        }

        internal function frame156():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame159():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1
            });
            if (this.self.isOnGround())
            {
                this.self.endAttack();
            };
        }

        internal function frame160():*
        {
            this.gotoAndPlay("redo");
        }

        internal function frame161():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1,
                "xSpeedDecayAir":this.afterDecay
            });
            this.self.unnattachFromGround();
            this.self.setYSpeed(-16);
            SSF2API.destroyTimer(this.self, this.fire);
            SSF2API.destroyTimer(this.self, this.afterImage);
            if (this.flip)
            {
                this.flip = false;
                this.self.flip();
            };
        }

        internal function frame166():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.landing);
        }

        internal function frame169():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1
            });
            if (this.self.isOnGround())
            {
                this.self.endAttack();
            };
        }

        internal function frame170():*
        {
            this.gotoAndPlay("redo");
        }


    }
}//package fox_fla

