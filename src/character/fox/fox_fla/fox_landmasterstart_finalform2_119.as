// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fox_fla.fox_landmasterstart_finalform2_119

package fox_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class fox_landmasterstart_finalform2_119 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var self:*;
        public var timer:int;
        public var timeMax:*;
        public var thrusting:Boolean;
        public var deathBounds:Object;
        public var controls:Object;
        public var finished:Boolean;
        public var character:*;

        public function fox_landmasterstart_finalform2_119()
        {
            addFrameScript(0, this.frame1, 15, this.frame16, 18, this.frame19, 19, this.frame20, 20, this.frame21, 21, this.frame22, 22, this.frame23, 26, this.frame27, 27, this.frame28, 37, this.frame38, 51, this.frame52);
        }

        public function foxRise():*
        {
            this.self.setY((this.self.getMC().y = (this.self.getMC().y - 25)));
            if ((this.self.getY() - this.deathBounds.y) <= 100)
            {
                SSF2API.destroyTimer(this.self, this.foxRise);
                gotoAndPlay("initLandmaster");
            };
        }

        public function landmasterControls():*
        {
            var _local_2:*;
            var _local_1:Object = this.self.getControls();
            if ((((_local_1.BUTTON1) || (_local_1.BUTTON2)) || (_local_1.GRAB)))
            {
                SSF2API.print("firing");
                SSF2API.destroyTimer(this.self, this.landmasterControls);
                gotoAndPlay("landmaster_fire");
            }
            else
            {
                if (((_local_1.LEFT) || (_local_1.RIGHT)))
                {
                    _local_2 = 1;
                    if (_local_1.LEFT)
                    {
                        _local_2 = -1;
                    };
                    if (this.self.isOnGround())
                    {
                        this.self.setXSpeed((6 * _local_2));
                    }
                    else
                    {
                        this.self.setXSpeed((3 * _local_2));
                    };
                    if (((!(this.currentLabel == "landmaster_walk")) && (this.self.isOnGround())))
                    {
                        gotoAndPlay("landmaster_walk");
                    };
                };
                if (_local_1.JUMP)
                {
                    this.self.unnattachFromGround();
                    this.self.setYSpeed(-15);
                    if (!this.thrusting)
                    {
                        SSF2API.playSound("landmaster_jump");
                        this.thrusting = true;
                    };
                }
                else
                {
                    this.thrusting = false;
                };
            };
        }

        public function startTimer():*
        {
            this.timer++;
            if (this.timer > this.timeMax)
            {
                this.self.endAttack();
            };
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.timer = 0;
            this.timeMax = (30 * 25);
            this.thrusting = false;
            if (((SSF2API.isReady()) && (this.self)))
            {
                this.finished = false;
                this.character = this.self;
                this.deathBounds = SSF2API.getDeathBounds();
                SSF2API.playSound("fox_fs");
                this.self.updateAttackStats({"allowControl":false});
            };
        }

        internal function frame16():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.foxRise);
        }

        internal function frame19():*
        {
            gotoAndPlay("rise");
        }

        internal function frame20():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.landmasterControls);
            SSF2API.createTimer(this.self, 1, 0, this.startTimer);
        }

        internal function frame21():*
        {
            this.self.updateAttackStats({
                "allowControl":false,
                "allowTurn":true,
                "air_ease":6
            });
        }

        internal function frame22():*
        {
            gotoAndPlay("landmaster_idle");
        }

        internal function frame23():*
        {
            SSF2API.playSound("landmaster_move");
        }

        internal function frame27():*
        {
            gotoAndPlay("landmaster_idle");
        }

        internal function frame28():*
        {
            SSF2API.playSound("landmaster_blast");
            this.self.updateAttackStats({
                "allowControl":false,
                "allowTurn":false
            });
        }

        internal function frame38():*
        {
            this.self.fireProjectile("landmasterLaser");
            SSF2API.playSound("fox_fireblast");
        }

        internal function frame52():*
        {
            SSF2API.createTimer(this.self, 1, 0, this.landmasterControls);
            gotoAndPlay("landmaster_idle");
        }


    }
}//package fox_fla

