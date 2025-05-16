// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//pikachu_fla.uspecial_new_35

package pikachu_fla
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

    public dynamic class uspecial_new_35 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;
        public var speed:Number;
        public var prevAngle:int;
        public var counter:*;
        public var beganOnGround:*;
        public var angle:*;

        public function uspecial_new_35()
        {
            addFrameScript(0, this.frame1, 6, this.frame7, 7, this.frame8, 8, this.frame9, 9, this.frame10, 13, this.frame14, 14, this.frame15, 16, this.frame17, 19, this.frame20, 26, this.frame27);
        }

        public function determineDirection():int
        {
            var _local_1:Object = this.self.getControls();
            var _local_2:Boolean = this.self.isOnGround();
            var _local_3:* = 90;
            if (((!((_local_1.UP) && (_local_1.DOWN))) || (!((_local_1.LEFT) && (_local_1.RIGHT)))))
            {
                if (((_local_1.UP) && (_local_1.RIGHT)))
                {
                    _local_3 = 45;
                }
                else
                {
                    if (((_local_1.RIGHT) && (_local_1.DOWN)))
                    {
                        _local_3 = 315;
                    }
                    else
                    {
                        if (((_local_1.DOWN) && (_local_1.LEFT)))
                        {
                            _local_3 = 225;
                        }
                        else
                        {
                            if (((_local_1.LEFT) && (_local_1.UP)))
                            {
                                _local_3 = 135;
                            }
                            else
                            {
                                if (_local_1.DOWN)
                                {
                                    if (!_local_2)
                                    {
                                        _local_3 = 270;
                                    }
                                    else
                                    {
                                        if (this.self.isFacingRight())
                                        {
                                            _local_3 = 0;
                                        }
                                        else
                                        {
                                            _local_3 = 180;
                                        };
                                    };
                                }
                                else
                                {
                                    if (_local_1.LEFT)
                                    {
                                        _local_3 = 181;
                                    }
                                    else
                                    {
                                        if (_local_1.RIGHT)
                                        {
                                            _local_3 = 360;
                                        }
                                        else
                                        {
                                            _local_3 = 90;
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
            return (_local_3);
        }

        public function rotate(_arg_1:int):*
        {
            if (((this.self.isFacingRight()) && ((_arg_1 > 90) && (_arg_1 < 270))))
            {
                this.self.faceLeft();
            }
            else
            {
                if (((!(this.self.isFacingRight())) && ((_arg_1 < 90) || (_arg_1 > 270))))
                {
                    this.self.faceRight();
                };
            };
            if (!this.self.isFacingRight())
            {
                _arg_1 = (_arg_1 + 180);
            };
            this.self.setRotation((-1 * _arg_1));
        }

        public function moveChar(_arg_1:int):*
        {
            this.self.setXSpeed((this.speed * Math.cos(((_arg_1 * Math.PI) / 180))), true);
            this.self.setYSpeed((this.speed * Math.sin((((_arg_1 + 180) * Math.PI) / 180))));
        }

        public function slide(_arg_1:*=null):*
        {
            this.self.setXSpeed(15, false);
            this.self.toLand();
        }

        public function land(_arg_1:*=null):*
        {
            this.self.resetMovement();
            this.self.toLand();
        }

        public function determineDirection2():*
        {
            var _local_1:Object = this.self.getControls();
            if (((((_local_1.UP) || (_local_1.DOWN)) || (_local_1.LEFT)) || (_local_1.RIGHT)))
            {
                this.angle = this.determineDirection();
                if (this.angle != this.prevAngle)
                {
                    SSF2API.destroyTimer(this.self, this.determineDirection2);
                    gotoAndPlay("go");
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.speed = 82;
            this.prevAngle = 361;
            this.counter = 0;
            this.beganOnGround = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.beganOnGround = this.self.isOnGround();
                this.self.updateAttackStats({"allowControl":false});
            };
        }

        internal function frame7():*
        {
            this.self.updateAttackStats({"air_ease":0});
            this.angle = this.determineDirection();
        }

        internal function frame8():*
        {
            this.counter++;
            this.prevAngle = this.angle;
            this.rotate(this.angle);
            this.moveChar(this.angle);
            SSF2API.playSound("pika_uspecial");
            SSF2API.playSound("pika_upB");
            if (((this.angle > 180) && (this.angle < 360)))
            {
                this.self.updateAttackStats({"air_ease":-1});
            };
            this.self.updateAttackStats({"air_ease":-1});
            this.self.attachEffect("quickAttackAfterImage");
            this.self.refreshAttackID();
            if (this.angle == 270)
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.land);
            }
            else
            {
                SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.slide);
            };
        }

        internal function frame9():*
        {
            this.self.attachEffect("quickAttackAfterImage");
        }

        internal function frame10():*
        {
            this.self.resetMovement();
            this.self.resetRotation();
            this.self.updateAttackStats({"air_ease":0});
            this.self.refreshAttackID();
        }

        internal function frame14():*
        {
            if (this.counter < 2)
            {
                gotoAndPlay("determineDirection2");
            }
            else
            {
                gotoAndPlay("ending");
            };
        }

        internal function frame15():*
        {
            this.self.updateAttackStats({"air_ease":0});
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.slide);
        }

        internal function frame17():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.determineDirection2);
        }

        internal function frame20():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1,
                "xSpeedDecay":0,
                "xSpeedDecayAir":0
            });
            SSF2API.destroyTimer(this.self, this.determineDirection2);
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.slide);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.land);
            if (this.self.isOnGround())
            {
                this.self.toLand();
            };
        }

        internal function frame27():*
        {
            gotoAndPlay("loop");
        }


    }
}//package pikachu_fla

