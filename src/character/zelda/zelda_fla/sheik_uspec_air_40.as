// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_uspec_air_40

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

    public dynamic class sheik_uspec_air_40 extends MovieClip 
    {

        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var hitBox7:MovieClip;
        public var hitBox8:MovieClip;
        public var hitBox9:MovieClip;
        public var self:*;
        public var speed:Number;
        public var noWind:*;
        public var xSpeed:Number;
        public var ySpeed:Number;
        public var controls:Object;
        public var isFacingRight:Boolean;
        public var ground:Boolean;

        public function sheik_uspec_air_40()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 4, this.frame5, 8, this.frame9, 15, this.frame16, 17, this.frame18, 24, this.frame25, 25, this.frame26, 43, this.frame44, 44, this.frame45, 47, this.frame48, 54, this.frame55);
        }

        public function toGround(_arg_1:*=null):*
        {
            this.noWind = true;
            this.gotoAndPlay("finishGround");
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toGround);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (((SSF2API.isReady()) && (this.self)))
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.self.updateAttackStats({"linkFrames":false});
            };
            this.speed = 21;
            this.noWind = false;
            this.xSpeed = 0;
            this.ySpeed = 0;
        }

        internal function frame2():*
        {
            this.self.setYSpeed(-15);
        }

        internal function frame5():*
        {
            this.self.updateAttackStats({"linkFrames":false});
            this.speed = 21;
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.setIntangibility(true);
        }

        internal function frame16():*
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
                        if ((((this.controls.RIGHT) && (this.controls.DOWN)) && (!(this.ground))))
                        {
                            this.xSpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                            this.ySpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                        }
                        else
                        {
                            if ((((this.controls.DOWN) && (this.controls.LEFT)) && (!(this.ground))))
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
                                    if (((this.controls.DOWN) && (!(this.ground))))
                                    {
                                        this.ySpeed = this.speed;
                                    }
                                    else
                                    {
                                        if (this.controls.LEFT)
                                        {
                                            this.xSpeed = (-1 * this.speed);
                                        }
                                        else
                                        {
                                            if (this.controls.RIGHT)
                                            {
                                                this.xSpeed = this.speed;
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
                            if ((((this.controls.RIGHT) && (this.controls.DOWN)) && (!(this.ground))))
                            {
                                this.xSpeed = ((1 * this.speed) * Math.cos(((45 * Math.PI) / 180)));
                                this.ySpeed = (this.speed * Math.cos(((45 * Math.PI) / 180)));
                            }
                            else
                            {
                                if ((((this.controls.DOWN) && (this.controls.LEFT)) && (!(this.ground))))
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
                                        if (((this.controls.DOWN) && (!(this.ground))))
                                        {
                                            this.ySpeed = this.speed;
                                        }
                                        else
                                        {
                                            if (this.controls.LEFT)
                                            {
                                                this.xSpeed = (-1 * this.speed);
                                            }
                                            else
                                            {
                                                if (this.controls.RIGHT)
                                                {
                                                    this.xSpeed = this.speed;
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

        internal function frame18():*
        {
            if (!this.xSpeed)
            {
                this.xSpeed = 0;
            };
            if (!this.ySpeed)
            {
                this.ySpeed = 0;
            };
            this.self.fireProjectile("uspecDamage");
            this.self.setXSpeed(this.xSpeed);
            this.self.setYSpeed(this.ySpeed);
            this.self.updateAttackStats({"air_ease":-1});
            this.self.playAttackSound(2);
        }

        internal function frame25():*
        {
            this.ground = this.self.isOnGround();
            if (this.ground)
            {
                gotoAndPlay("finishGround");
            }
            else
            {
                gotoAndPlay("finishAir");
            };
        }

        internal function frame26():*
        {
            this.self.setIntangibility(false);
            if (!this.noWind)
            {
                this.self.fireProjectile("uspecNoDamage");
            };
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({
                "air_ease":-1,
                "allowControl":false
            });
            this.self.playAttackSound(3);
        }

        internal function frame44():*
        {
            this.self.endAttack();
        }

        internal function frame45():*
        {
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toGround);
            this.self.setIntangibility(false);
            this.self.fireProjectile("uspecNoDamage");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1
            });
            this.self.playAttackSound(3);
        }

        internal function frame48():*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.toGround);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.self.toLand);
        }

        internal function frame55():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

