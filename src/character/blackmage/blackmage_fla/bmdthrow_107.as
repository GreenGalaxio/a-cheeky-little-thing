// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//blackmage_fla.bmdthrow_107

package blackmage_fla
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

    public dynamic class bmdthrow_107 extends MovieClip 
    {

        public var attackBox:MovieClip;
        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var touchBox:MovieClip;
        public var self:*;
        public var xframe:String;

        public function bmdthrow_107()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 10, this.frame11, 16, this.frame17, 18, this.frame19, 20, this.frame21, 22, this.frame23, 24, this.frame25, 31, this.frame32, 32, this.frame33, 37, this.frame38);
        }

        internal function frame1():*
        {
            if (SSF2API.isReady())
            {
                this.self = SSF2API.getCharacter(this);
            };
            this.xframe = null;
        }

        internal function frame9():*
        {
            this.self.playAttackSound(1);
        }

        internal function frame11():*
        {
            this.xframe = "attack";
        }

        internal function frame17():*
        {
            this.self.updateAttackBoxStats(1, {"poisonLength":1});
        }

        internal function frame19():*
        {
            this.self.updateAttackBoxStats(1, {"poisonLength":300});
            this.self.refreshAttackID();
        }

        internal function frame21():*
        {
            this.self.refreshAttackID();
        }

        internal function frame23():*
        {
            this.self.refreshAttackID();
        }

        internal function frame25():*
        {
            this.self.refreshAttackID();
        }

        internal function frame32():*
        {
            this.self.updateAttackBoxStats(1, {
                "damage":4,
                "hasEffect":true
            });
        }

        internal function frame33():*
        {
            this.self.refreshAttackID();
        }

        internal function frame38():*
        {
            this.self.endAttack();
        }


    }
}//package blackmage_fla

