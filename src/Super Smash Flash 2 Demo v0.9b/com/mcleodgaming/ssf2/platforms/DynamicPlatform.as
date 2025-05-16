package com.mcleodgaming.ssf2.platforms
{
    import com.mcleodgaming.ssf2.util.FrameTimer;
    import __AS3__.vec.Vector;
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2.engine.StageData;
    import com.mcleodgaming.ssf2.engine.*;
    import com.mcleodgaming.ssf2.util.*;
    import __AS3__.vec.*;

    public class DynamicPlatform extends MovingPlatform 
    {

        private var m_moveTimer:FrameTimer;
        private var m_waitTimer:FrameTimer;
        private var m_wait:Boolean;
        private var m_platformMovement:Vector.<PlatformMovement>;
        private var m_moveIndex:int;
        private var m_xLoc:Number;
        private var m_yLoc:Number;

        public function DynamicPlatform(_arg_1:MovieClip, _arg_2:StageData)
        {
            var _local_4:PlatformMovement;
            super(_arg_1, _arg_2);
            this.m_platformMovement = new Vector.<PlatformMovement>();
            this.m_moveIndex = ((m_platform.startIndex) ? m_platform.startIndex : 0);
            var _local_3:int = 1;
            while (m_platform[("movement" + _local_3)])
            {
                _local_4 = new PlatformMovement();
                _local_4.xAccel = ((m_platform[("movement" + _local_3)].xAccel) ? m_platform[("movement" + _local_3)].xAccel : 0);
                _local_4.xDecel = ((m_platform[("movement" + _local_3)].xDecel) ? m_platform[("movement" + _local_3)].xDecel : 0);
                _local_4.yAccel = ((m_platform[("movement" + _local_3)].yAccel) ? m_platform[("movement" + _local_3)].yAccel : 0);
                _local_4.yDecel = ((m_platform[("movement" + _local_3)].yDecel) ? m_platform[("movement" + _local_3)].yDecel : 0);
                _local_4.moveTime = ((m_platform[("movement" + _local_3)].moveTime) ? m_platform[("movement" + _local_3)].moveTime : 0);
                _local_4.waitTime = ((m_platform[("movement" + _local_3)].waitTime) ? m_platform[("movement" + _local_3)].waitTime : 0);
                _local_4.xSpeed = ((m_platform[("movement" + _local_3)].xSpeed) ? m_platform[("movement" + _local_3)].xSpeed : 0);
                _local_4.ySpeed = ((m_platform[("movement" + _local_3)].ySpeed) ? m_platform[("movement" + _local_3)].ySpeed : 0);
                _local_4.fallthrough = ((m_platform[("movement" + _local_3)].fallthrough !== undefined) ? m_platform[("movement" + _local_3)].fallthrough : fallthrough);
                _local_4.noDropThrough = ((m_platform[("movement" + _local_3)].noDropThrough !== undefined) ? m_platform[("movement" + _local_3)].noDropThrough : noDropThrough);
                _local_4.camFocus = ((m_platform[("movement" + _local_3)].camFocus !== undefined) ? m_platform[("movement" + _local_3)].camFocus : false);
                this.m_platformMovement.push(_local_4);
                _local_3++;
            };
            if (this.m_platformMovement.length == 0)
            {
                this.m_platformMovement.push(new PlatformMovement());
                this.m_platformMovement[0].xAccel = 0;
                this.m_platformMovement[0].xDecel = 0;
                this.m_platformMovement[0].yAccel = 0;
                this.m_platformMovement[0].yDecel = 0;
                this.m_platformMovement[0].moveTime = 0;
                this.m_platformMovement[0].waitTime = 0;
                this.m_platformMovement[0].xSpeed = 0;
                this.m_platformMovement[0].ySpeed = 0;
                this.m_platformMovement[0].fallthrough = fallthrough;
                this.m_platformMovement[0].noDropThrough = noDropThrough;
                this.m_platformMovement[0].camFocus = false;
            };
            this.m_moveTimer = new FrameTimer(this.m_platformMovement[this.m_moveIndex].moveTime);
            this.m_waitTimer = new FrameTimer(this.m_platformMovement[this.m_moveIndex].waitTime);
            m_xSpeed = ((this.m_platformMovement[this.m_moveIndex].xAccel > 0) ? 0 : this.m_platformMovement[this.m_moveIndex].xSpeed);
            m_ySpeed = ((this.m_platformMovement[this.m_moveIndex].yAccel > 0) ? 0 : this.m_platformMovement[this.m_moveIndex].ySpeed);
            this.m_wait = false;
            this.m_xLoc = m_platform.x;
            this.m_yLoc = m_platform.y;
            if (m_foregroundPiece != null)
            {
                m_foregroundPoint.x = m_foregroundPiece.x;
                m_foregroundPoint.y = m_foregroundPiece.y;
            };
            findLedges();
            if (this.m_platformMovement[0].camFocus)
            {
                STAGEDATA.CamRef.addForcedTarget(m_platform);
            };
        }

        override protected function move():void
        {
            storeOldLocation();
            if ((!(this.m_wait)))
            {
                this.m_moveTimer.tick();
                this.m_xLoc = (this.m_xLoc + m_xSpeed);
                this.m_yLoc = (this.m_yLoc + m_ySpeed);
                m_platform.x = this.m_xLoc;
                m_platform.y = this.m_yLoc;
                syncLedges();
                syncForeground();
                if ((!(this.m_moveTimer.IsComplete)))
                {
                    if (this.m_platformMovement[this.m_moveIndex].xAccel > 0)
                    {
                        if (((this.m_platformMovement[this.m_moveIndex].xSpeed > 0) && (m_xSpeed < this.m_platformMovement[this.m_moveIndex].xSpeed)))
                        {
                            m_xSpeed = (m_xSpeed + this.m_platformMovement[this.m_moveIndex].xAccel);
                        }
                        else
                        {
                            if (((this.m_platformMovement[this.m_moveIndex].xSpeed < 0) && (m_xSpeed > this.m_platformMovement[this.m_moveIndex].xSpeed)))
                            {
                                m_xSpeed = (m_xSpeed - this.m_platformMovement[this.m_moveIndex].xAccel);
                            };
                        };
                    };
                    if (this.m_platformMovement[this.m_moveIndex].yAccel > 0)
                    {
                        if (((this.m_platformMovement[this.m_moveIndex].ySpeed > 0) && (m_ySpeed < this.m_platformMovement[this.m_moveIndex].ySpeed)))
                        {
                            m_ySpeed = (m_ySpeed + this.m_platformMovement[this.m_moveIndex].yAccel);
                        }
                        else
                        {
                            if (((this.m_platformMovement[this.m_moveIndex].ySpeed < 0) && (m_ySpeed > this.m_platformMovement[this.m_moveIndex].ySpeed)))
                            {
                                m_ySpeed = (m_ySpeed - this.m_platformMovement[this.m_moveIndex].yAccel);
                            };
                        };
                    };
                }
                else
                {
                    if (this.m_moveTimer.IsComplete)
                    {
                        if (this.m_platformMovement[this.m_moveIndex].xDecel > 0)
                        {
                            if (this.m_platformMovement[this.m_moveIndex].xSpeed > 0)
                            {
                                m_xSpeed = (m_xSpeed - this.m_platformMovement[this.m_moveIndex].xDecel);
                                if (m_xSpeed <= 0)
                                {
                                    this.m_moveTimer.reset();
                                    this.m_wait = true;
                                };
                            }
                            else
                            {
                                if (this.m_platformMovement[this.m_moveIndex].xSpeed < 0)
                                {
                                    m_xSpeed = (m_xSpeed + this.m_platformMovement[this.m_moveIndex].xDecel);
                                    if (m_xSpeed >= 0)
                                    {
                                        this.m_moveTimer.reset();
                                        this.m_wait = true;
                                    };
                                };
                            };
                        };
                        if (this.m_platformMovement[this.m_moveIndex].yDecel > 0)
                        {
                            if (this.m_platformMovement[this.m_moveIndex].ySpeed > 0)
                            {
                                m_ySpeed = (m_ySpeed - this.m_platformMovement[this.m_moveIndex].yDecel);
                                if (m_ySpeed < 0)
                                {
                                    this.m_moveTimer.reset();
                                    this.m_wait = true;
                                };
                            }
                            else
                            {
                                if (this.m_platformMovement[this.m_moveIndex].ySpeed < 0)
                                {
                                    m_ySpeed = (m_ySpeed + this.m_platformMovement[this.m_moveIndex].yDecel);
                                    if (m_ySpeed > 0)
                                    {
                                        this.m_moveTimer.reset();
                                        this.m_wait = true;
                                    };
                                }
                                else
                                {
                                    this.m_moveTimer.reset();
                                    this.m_wait = true;
                                };
                            };
                        };
                        if (((this.m_platformMovement[this.m_moveIndex].xDecel <= 0) && (this.m_platformMovement[this.m_moveIndex].yDecel <= 0)))
                        {
                            this.m_moveTimer.reset();
                            this.m_wait = true;
                        };
                    };
                };
            };
            if (this.m_wait)
            {
                if (this.m_waitTimer.IsComplete)
                {
                    this.m_moveTimer.reset();
                    this.m_waitTimer.reset();
                    this.incrementMovement();
                    this.m_moveTimer.MaxTime = this.m_platformMovement[this.m_moveIndex].moveTime;
                    this.m_waitTimer.MaxTime = ((this.m_platformMovement[this.m_moveIndex].waitTime < 0) ? int.MAX_VALUE : this.m_platformMovement[this.m_moveIndex].waitTime);
                    m_xSpeed = ((this.m_platformMovement[this.m_moveIndex].xAccel > 0) ? 0 : this.m_platformMovement[this.m_moveIndex].xSpeed);
                    m_ySpeed = ((this.m_platformMovement[this.m_moveIndex].yAccel > 0) ? 0 : this.m_platformMovement[this.m_moveIndex].ySpeed);
                    noDropThrough = this.m_platformMovement[this.m_moveIndex].noDropThrough;
                    fallthrough = this.m_platformMovement[this.m_moveIndex].fallthrough;
                    this.m_wait = false;
                    if (this.m_platformMovement[this.m_moveIndex].camFocus)
                    {
                        STAGEDATA.CamRef.addForcedTarget(m_platform);
                    }
                    else
                    {
                        STAGEDATA.CamRef.deleteForcedTarget(m_platform);
                    };
                };
                if (this.m_waitTimer.MaxTime < int.MAX_VALUE)
                {
                    this.m_waitTimer.tick();
                };
            };
            super.move();
        }

        private function incrementMovement():void
        {
            this.m_moveIndex++;
            if (this.m_moveIndex >= this.m_platformMovement.length)
            {
                this.m_moveIndex = 0;
            };
        }


    }
}//package com.mcleodgaming.ssf2.platforms