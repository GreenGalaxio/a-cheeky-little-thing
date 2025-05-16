// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//lloyd_fla.lloyd_beast_26

package lloyd_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;
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

    public dynamic class lloyd_beast_26 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var hitBox5:MovieClip;
        public var hitBox6:MovieClip;
        public var self:*;
        public var artesCount:Number;
        public var xframe:String;

        public function lloyd_beast_26()
        {
            addFrameScript(0, this.frame1, 2, this.frame3, 3, this.frame4, 8, this.frame9, 9, this.frame10, 12, this.frame13, 15, this.frame16, 18, this.frame19, 21, this.frame22, 31, this.frame32);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.artesCount = this.self.getGlobalVariable("artesNumber");
            };
        }

        internal function frame3():*
        {
            if (this.artesCount > 0)
            {
                this.gotoAndPlay("attack");
            };
        }

        internal function frame4():*
        {
            this.xframe = "charging";
        }

        internal function frame9():*
        {
            this.gotoAndPlay("charging");
        }

        internal function frame10():*
        {
            this.xframe = "attack";
            this.self.playVoiceSound(2);
        }

        internal function frame13():*
        {
            this.self.playAttackSound(2);
            this.self.playVoiceSound(1);
        }

        internal function frame16():*
        {
            this.self.updateAttackBoxStats(1, {"damage":9});
            this.self.playAttackSound(1);
        }

        internal function frame19():*
        {
            this.self.updateAttackBoxStats(1, {"damage":8});
        }

        internal function frame22():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":7,
                "kbConstant":20
            });
        }

        internal function frame32():*
        {
            this.self.endAttack();
        }


    }
}//package lloyd_fla

