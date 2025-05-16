// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//yoshi_fla.Yoshi_dspecial_42

package yoshi_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
    import com.mcleodgaming.ssf2api.core.SSF2Event;
    import flash.events.Event;
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

    public dynamic class Yoshi_dspecial_42 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var attackBox2:MovieClip;
        public var hand:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var self:*;

        public function Yoshi_dspecial_42()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 5, this.frame6, 13, this.frame14, 18, this.frame19, 19, this.frame20, 32, this.frame33);
        }

        public function jumpToContinue(_arg_1:Event=null):*
        {
            SSF2API.removeEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackStats({"allowControl":false});
            gotoAndPlay("continue");
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.self.playVoiceSound(1);
                this.self.playAttackSound(1);
            };
        }

        internal function frame3():*
        {
            this.self.setYSpeed(-35);
            this.self.setXSpeed(12, false);
        }

        internal function frame6():*
        {
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateAttackStats({
                "air_ease":0,
                "allowControl":false
            });
        }

        internal function frame14():*
        {
            this.self.updateAttackStats({
                "allowControl":true,
                "air_ease":-1
            });
            this.self.setYSpeed(35);
            SSF2API.addEventListener(this.self, SSF2Event.GROUND_TOUCH, this.jumpToContinue);
            this.self.updateAttackBoxStats(1, {
                "power":60,
                "kbConstant":90,
                "priority":5
            });
            this.self.updateAttackBoxStats(2, {
                "power":60,
                "kbConstant":90,
                "priority":5
            });
            this.self.refreshAttackID();
        }

        internal function frame19():*
        {
            gotoAndPlay("loop");
        }

        internal function frame20():*
        {
            this.self.setYSpeed(0);
            this.self.setXSpeed(0);
            this.self.updateAttackStats({"allowControl":false});
            this.self.updateAttackBoxStats(1, {
                "power":55,
                "kbConstant":70,
                "damage":4
            });
            this.self.updateAttackBoxStats(2, {
                "power":55,
                "kbConstant":70,
                "damage":4
            });
            this.self.playAttackSound(2);
        }

        internal function frame33():*
        {
            this.self.endAttack();
        }


    }
}//package yoshi_fla

