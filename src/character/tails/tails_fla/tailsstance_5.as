// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailsstance_5

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class tailsstance_5 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var rand:int;

        public function tailsstance_5()
        {
            addFrameScript(0, this.frame1, 27, this.frame28, 73, this.frame74);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.rand = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.rand = (10 * SSF2API.random());
                if (this.rand >= 8)
                {
                    gotoAndPlay("yawn");
                };
            };
        }

        internal function frame28():*
        {
            gotoAndPlay("idle");
        }

        internal function frame74():*
        {
            gotoAndPlay("idle");
        }


    }
}//package tails_fla

