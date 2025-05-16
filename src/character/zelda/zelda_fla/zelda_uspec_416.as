// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.zelda_uspec_416

package zelda_fla
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

    public dynamic class zelda_uspec_416 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var self:*;
        public var speed:Number;
        public var xSpeed:Number;
        public var ySpeed:Number;
        public var controls:Object;
        public var isFacingRight:Boolean;
        public var ground:Boolean;

        public function zelda_uspec_416()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 13, this.frame14, 16, this.frame17, 17, this.frame18, 18, this.frame19, 26, this.frame27, 30, this.frame31, 35, this.frame36);
        }

        public function decel(_arg_1:*=null):void
        {
            this.xSpeed = (this.self.getXSpeed() / 2.5);
            this.ySpeed = 0;
            this.self.setXSpeed(this.xSpeed);
            this.self.setYSpeed(this.ySpeed);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
            };
            this.speed = 42;
            this.xSpeed = 0;
            this.ySpeed = 0;
        }

        internal function frame3():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame4():*
        {
            this.self.playVoiceSound(1);
        }

        internal function frame14():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame17():*
        {
            this.self.updateAttackStats({"air_ease":-1});
        }

        internal function frame18():*
        {
            this.controls = this.self.getControls();
            this.isFacingRight = this.self.isFacingRight();
            this.ground = this.self.isOnGround();
            this.self.updateAttackStats({"allowControl":false});
            if (((!((this.controls.UP) && (this.controls.DOWN))) && (!((this.controls.LEFT) && (this.controls.RIGHT)))))
            {
                if (this.isFacingRight)
                {
                    if (((this.controls.UP) && (this.controls.RIGHT)))
                    {
                        this.xSpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                        this.ySpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                    }
                    else
                    {
                        if (((this.controls.RIGHT) && (this.controls.DOWN)))
                        {
                            this.xSpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                            this.ySpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                        }
                        else
                        {
                            if (((this.controls.DOWN) && (this.controls.LEFT)))
                            {
                                this.xSpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                this.ySpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                            }
                            else
                            {
                                if (((this.controls.LEFT) && (this.controls.UP)))
                                {
                                    this.xSpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                    this.ySpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                }
                                else
                                {
                                    if (this.controls.DOWN)
                                    {
                                        this.ySpeed = this.speed;
                                    }
                                    else
                                    {
                                        if (this.controls.LEFT)
                                        {
                                            this.xSpeed = (-1 * this.speed);
                                            this.self.updateAttackStats({"air_ease":0});
                                        }
                                        else
                                        {
                                            if (this.controls.RIGHT)
                                            {
                                                this.xSpeed = this.speed;
                                                this.self.updateAttackStats({"air_ease":0});
                                            }
                                            else
                                            {
                                                this.ySpeed = (-1 * this.speed);
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                }
                else
                {
                    if (!this.isFacingRight)
                    {
                        if (((this.controls.UP) && (this.controls.RIGHT)))
                        {
                            this.xSpeed = ((1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                            this.ySpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                        }
                        else
                        {
                            if (((this.controls.RIGHT) && (this.controls.DOWN)))
                            {
                                this.xSpeed = ((1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                this.ySpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                            }
                            else
                            {
                                if (((this.controls.DOWN) && (this.controls.LEFT)))
                                {
                                    this.xSpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                    this.ySpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                                }
                                else
                                {
                                    if (((this.controls.LEFT) && (this.controls.UP)))
                                    {
                                        this.xSpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                        this.ySpeed = ((-1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                    }
                                    else
                                    {
                                        if (this.controls.DOWN)
                                        {
                                            this.ySpeed = this.speed;
                                        }
                                        else
                                        {
                                            if (this.controls.LEFT)
                                            {
                                                this.xSpeed = (-1 * this.speed);
                                                this.self.updateAttackStats({"air_ease":0});
                                            }
                                            else
                                            {
                                                if (this.controls.RIGHT)
                                                {
                                                    this.xSpeed = this.speed;
                                                    this.self.updateAttackStats({"air_ease":0});
                                                }
                                                else
                                                {
                                                    this.ySpeed = (-1 * this.speed);
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function frame19():*
        {
            this.self.setXSpeed(this.xSpeed);
            this.self.setYSpeed(this.ySpeed);
            this.self.updateAttackStats({"air_ease":-1});
            if (!this.self.isOnGround())
            {
                this.self.updateAttackStats({"canFallOff":false});
            }
            else
            {
                this.self.updateAttackStats({"air_ease":0});
            };
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.decel);
        }

        internal function frame27():*
        {
            this.self.setIntangibility(false);
            this.self.updateAttackBoxStats(1, {
                "power":60,
                "damage":10,
                "direction":45,
                "burn":true,
                "effect_id":"effect_firehit1"
            });
            this.self.resetMovement();
            this.self.playAttackSound(2);
            this.self.refreshAttackID();
            this.self.updateAttackStats({"air_ease":4});
        }

        internal function frame31():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "linkFrames":true
            });
        }

        internal function frame36():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

