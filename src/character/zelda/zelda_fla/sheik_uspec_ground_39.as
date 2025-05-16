// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//zelda_fla.sheik_uspec_ground_39

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

    public dynamic class sheik_uspec_ground_39 extends MovieClip 
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
        public var xSpeed:Number;
        public var ySpeed:Number;
        public var xframe:*;
        public var controls:Object;
        public var isFacingRight:Boolean;
        public var ground:Boolean;

        public function sheik_uspec_ground_39()
        {
            addFrameScript(0, this.frame1, 3, this.frame4, 8, this.frame9, 16, this.frame17, 18, this.frame19, 25, this.frame26, 26, this.frame27, 44, this.frame45, 45, this.frame46, 55, this.frame56);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            if (SSF2API.isReady())
            {
                SSF2API.addEventListener(this.self, SSF2Event.CHAR_ATTACK_COMPLETE, this.self.toHelpless);
                this.self.updateAttackStats({"allowControl":false});
            };
            this.speed = 21;
            this.xSpeed = 0;
            this.ySpeed = 0;
            this.xframe = "ground";
        }

        internal function frame4():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame9():*
        {
            this.self.updateAttackStats({"linkFrames":false});
            this.self.setIntangibility(true);
        }

        internal function frame17():*
        {
            this.controls = this.self.getControls();
            this.isFacingRight = this.self.isFacingRight();
            this.ground = this.self.isOnGround();
            this.speed = 21;
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
                                                if (!((this.controls.DOWN) && (this.ground)))
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
                                                    if (!((this.controls.DOWN) && (this.ground)))
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
            };
        }

        internal function frame19():*
        {
            this.self.fireProjectile("uspecDamage");
            this.self.updateAttackStats({
                "canFallOff":true,
                "air_ease":0
            });
            this.self.setXSpeed(this.xSpeed);
            if (this.ySpeed < 0)
            {
                this.self.updateAttackStats({
                    "canFallOff":true,
                    "air_ease":-1
                });
            };
            this.self.setYSpeed(this.ySpeed);
            this.self.playAttackSound(2);
        }

        internal function frame26():*
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

        internal function frame27():*
        {
            this.self.setIntangibility(false);
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"air_ease":-1});
            this.self.fireProjectile("uspecNoDamage");
            this.self.playAttackSound(3);
            this.self.updateAttackStats({"canFallOff":false});
        }

        internal function frame45():*
        {
            this.self.endAttack();
        }

        internal function frame46():*
        {
            this.self.setIntangibility(false);
            this.self.fireProjectile("uspecNoDamage");
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({"allowControl":true});
            this.self.playAttackSound(3);
        }

        internal function frame56():*
        {
            this.self.endAttack();
        }


    }
}//package zelda_fla

