// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ness_fla.ness_stance_4

package ness_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class ness_stance_4 extends MovieClip 
    {

        public var hitBox:MovieClip;
        public var hitBox2:MovieClip;
        public var hitBox3:MovieClip;
        public var hitBox4:MovieClip;
        public var itemBox:MovieClip;
        public var self:*;
        public var rand:int;

        public function ness_stance_4()
        {
            addFrameScript(0, this.frame1, 26, this.frame27, 71, this.frame72, 119, this.frame120);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            this.rand = 0;
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                this.rand = (100 * SSF2API.random());
                if (this.rand >= 90)
                {
                    gotoAndPlay("gasp");
                }
                else
                {
                    if (this.rand >= 80)
                    {
                        gotoAndPlay("achoo");
                    };
                };
            };
        }

        internal function frame27():*
        {
            gotoAndPlay("idle");
        }

        internal function frame72():*
        {
            gotoAndPlay("idle");
        }

        internal function frame120():*
        {
            gotoAndPlay("idle");
        }


    }
}//package ness_fla

