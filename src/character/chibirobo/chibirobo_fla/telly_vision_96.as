// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//chibirobo_fla.telly_vision_96

package chibirobo_fla
{
    import flash.display.MovieClip;
    import flash.geom.Point;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.display.*;
    import flash.media.*;
    import flash.geom.*;
    import flash.events.*;
    import adobe.utils.*;
    import flash.accessibility.*;
    import flash.desktop.*;
    import flash.errors.*;
    import flash.external.*;
    import flash.filters.*;
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

    public dynamic class telly_vision_96 extends MovieClip 
    {

        public var self:*;
        public var changeAnimationReady:*;
        public var shouldMove:Boolean;
        public var hasProjectile:Boolean;
        public var currentAnimation:*;
        public var character:*;
        public var targetCoors:Point;

        public function telly_vision_96()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 8, this.frame9, 9, this.frame10, 49, this.frame50, 50, this.frame51, 59, this.frame60, 60, this.frame61, 86, this.frame87, 87, this.frame88, 123, this.frame124);
        }

        public function sendToEnd(_arg_1:*=null):void
        {
            this.character.setGlobalVariable("telly", null);
            this.self.destroyTimer(this.moveTelly);
            SSF2API.print("chibi is dead, all hail lord telly");
            this.self.removeEventListener(SSF2Event.PROJ_DESTROYED, this.sendToEnd);
            this.self.removeEventListener(SSF2Event.CHAR_KO_POINT, this.sendToKoPoint);
            this.self.removeEventListener(SSF2Event.CHAR_KO_DEATH, this.sendToDeath);
            this.self.removeEventListener(SSF2Event.CHAR_HURT, this.sendToHurt);
            this.self.destroy();
        }

        public function sendToKoPoint(_arg_1:*=null):void
        {
            if (this.changeAnimationReady)
            {
                gotoAndPlay("ko_point");
            };
        }

        public function sendToHurt(_arg_1:*=null):void
        {
            if (this.changeAnimationReady)
            {
                gotoAndPlay("hurt");
            };
        }

        public function sendToDeath(_arg_1:*=null):void
        {
            if (this.changeAnimationReady)
            {
                gotoAndPlay("death");
            };
        }

        public function sendToProjectile(_arg_1:*=null):void
        {
            if (((this.changeAnimationReady) && (!(this.currentAnimation == "projectile"))))
            {
                gotoAndPlay("projectile");
            };
        }

        public function moveTelly():void
        {
            var _local_1:Number;
            var _local_2:Number;
            this.character = SSF2API.getCharacter(this.self.getID());
            if (((this.character.getLives() == 0) || (this.character.isStandBy())))
            {
                this.sendToEnd();
            }
            else
            {
                this.targetCoors = new Point(this.character.getX(), this.character.getY());
                this.targetCoors.y = (this.targetCoors.y - (this.character.getHeight() * 1.5));
                if (this.character.isFacingRight())
                {
                    this.targetCoors.x = (this.targetCoors.x - this.character.getWidth());
                }
                else
                {
                    this.targetCoors.x = (this.targetCoors.x + this.character.getWidth());
                };
                _local_1 = ((this.targetCoors.x - this.self.getX()) / 10);
                _local_2 = ((this.targetCoors.y - this.self.getY()) / 10);
                if (this.shouldMove)
                {
                    this.self.setXSpeed(_local_1);
                    this.self.setYSpeed(_local_2);
                    this.self.setRotation(_local_1);
                }
                else
                {
                    this.self.setYSpeed(0);
                    this.self.setYSpeed(0);
                    this.self.setRotation(0);
                };
                if (_local_1 > 0.1)
                {
                    this.self.faceRight();
                }
                else
                {
                    if (_local_1 < -0.1)
                    {
                        this.self.faceLeft();
                    }
                    else
                    {
                        if (this.character.isFacingRight())
                        {
                            this.self.faceRight();
                        }
                        else
                        {
                            this.self.faceLeft();
                        };
                    };
                };
                if (this.hasProjectile)
                {
                    this.sendToProjectile();
                };
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getProjectile(this);
            this.changeAnimationReady = true;
            this.shouldMove = true;
            this.hasProjectile = false;
            this.currentAnimation = "idle";
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.character = SSF2API.getCharacter(this.self.getID());
                if (this.character)
                {
                    this.targetCoors = new Point(this.character.getX(), this.character.getY());
                    this.self.createTimer(1, -1, this.moveTelly, {"persistent":true});
                    this.self.addEventListener(SSF2Event.PROJ_DESTROYED, this.sendToEnd);
                    this.character.addEventListener(SSF2Event.CHAR_KO_POINT, this.sendToKoPoint, {"persistent":true});
                    this.character.addEventListener(SSF2Event.CHAR_HURT, this.sendToHurt, {"persistent":true});
                    this.character.addEventListener(SSF2Event.CHAR_KO_DEATH, this.sendToDeath, {"persistent":true});
                    this.self.swapDepths(this.character);
                };
            };
        }

        internal function frame2():*
        {
            this.changeAnimationReady = true;
            this.shouldMove = true;
            this.currentAnimation = "idle";
        }

        internal function frame9():*
        {
            gotoAndPlay("idle");
        }

        internal function frame10():*
        {
            this.changeAnimationReady = false;
            this.shouldMove = false;
            this.currentAnimation = "ko_point";
        }

        internal function frame50():*
        {
            gotoAndPlay("idle");
        }

        internal function frame51():*
        {
            this.changeAnimationReady = false;
            this.shouldMove = true;
            this.currentAnimation = "hurt";
        }

        internal function frame60():*
        {
            gotoAndPlay("idle");
        }

        internal function frame61():*
        {
            this.changeAnimationReady = false;
            this.shouldMove = false;
            this.currentAnimation = "death";
        }

        internal function frame87():*
        {
            gotoAndPlay("idle");
        }

        internal function frame88():*
        {
            this.changeAnimationReady = true;
            this.shouldMove = true;
            this.currentAnimation = "projectile";
        }

        internal function frame124():*
        {
            gotoAndPlay("idle");
        }


    }
}//package chibirobo_fla

