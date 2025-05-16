// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//jigglypuff_fla.jiggly_starKO_106

package jigglypuff_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class jiggly_starKO_106 extends MovieClip 
    {

        public var self:*;

        public function jiggly_starKO_106()
        {
            addFrameScript(0, this.frame1);
        }

        internal function frame1():*
        {
            this.self = SSF2API.getCharacter(this);
            if ((((parent) && (SSF2API.isReady())) && (this.self)))
            {
                SSF2API.playSound("jiggs_starko");
            };
        }


    }
}//package jigglypuff_fla

